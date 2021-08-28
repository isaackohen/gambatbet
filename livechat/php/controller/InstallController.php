<?php
class InstallController extends Controller { protected $extensions = array('PDO', 'pdo_mysql'); protected $writableFiles = array('data' => 'dir', 'upload' => 'dir', 'php/config/app.settings.php' => 'file', 'php/config/parameters.php' => 'file', 'php/config/widget.blacklist.txt' => 'file'); protected $writableFilesForVerify = array('php/config/parameters.php' => 'file'); protected $memoryServices = array('memory', 'memory.talks_map', 'memory.watched_talks', 'memory.stats', 'memory.online', 'memory.msg_q'); public function indexAction() { return $this->render('admin/install.html'); } public function verifyAction() { return $this->render('admin/install-verify.html', array('config' => $this->get('config')->data, 'trans' => json_encode($this->getJsTranslations()))); } public function verifySubmitAction() { $spfdfe1b = $this->get('request'); $spddeefd = $this->get('verify'); $sp10ff92 = $spfdfe1b->postVar('config'); $sp26b997 = $sp10ff92['services']['verify']['code']; $sp3bec42 = $sp10ff92['services']['verify']['token']; $sp58815f = array(); foreach ($this->writableFilesForVerify as $sp515ec5 => $spacf078) { if (!is_writable(ROOT_DIR . '/../' . $sp515ec5)) { $sp58815f[$sp515ec5] = $spacf078; } } if (!empty($sp58815f)) { return $this->render('admin/install-verify.html', array('config' => $this->get('config')->data, 'notWritable' => $sp58815f, 'trans' => json_encode($this->getJsTranslations()))); } if ($spddeefd->verifyCodeToken($sp26b997, $sp3bec42)) { $spddeefd->updateInstallation($sp26b997, $sp3bec42); return $this->redirect('Install:wizard'); } return $this->redirect('Install:verify'); } public function wizardAction() { ini_set('opcache.enable', 0); if (!$this->get('verify')->verifyInstallation()) { return $this->redirect('Install:verify'); } $sp58b40a = $this->get('config')->data; return $this->render('admin/install-wizard.html', array('config' => $sp58b40a)); } public function wizard2Action() { $spfdfe1b = $this->get('request'); $sp7b4fd9 = $this->get('config'); $sp58b40a = $spfdfe1b->postVar('config'); $sp4a4454 = $this->ensureValidConfig(); if (!empty($sp4a4454)) { return $sp4a4454; } $sp7c02ca = array(); foreach ($this->extensions as $sp2ed869) { if (!extension_loaded($sp2ed869)) { $sp7c02ca[] = $sp2ed869; } } if (!empty($sp7c02ca)) { return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'missingExtensions' => $sp7c02ca)); } $sp58815f = array(); foreach ($this->writableFiles as $sp515ec5 => $spacf078) { if (!is_writable(ROOT_DIR . '/../' . $sp515ec5)) { $sp58815f[$sp515ec5] = $spacf078; } } if (!empty($sp58815f)) { return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'notWritable' => $sp58815f)); } if (!$this->createMemoryFiles()) { return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'notWritable' => array('data' => 'dir'))); } $spd2d32a = false; $spa7b664 = $sp7b4fd9->data['dbType'] . ':host=' . $sp58b40a['dbHost'] . ';port=' . $sp58b40a['dbPort']; try { $sp7b4fd9->data['appSettings']['installed'] = false; if (!$this->get('db')->connect($spa7b664, $sp58b40a['dbUser'], $sp58b40a['dbPassword'])) { $spd2d32a = true; } } catch (Exception $sp338ba2) { $spd2d32a = true; } if ($spd2d32a) { return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'dbError' => $spd2d32a)); } return $this->render('admin/install-wizard-2.html', array('config' => $sp58b40a)); } public function wizard3Action() { $spfdfe1b = $this->get('request'); $sp7b4fd9 = $this->get('config'); $sp58b40a = $spfdfe1b->postVar('config'); $sp4a4454 = $this->ensureValidConfig(); if (!empty($sp4a4454)) { return $sp4a4454; } unset($sp58b40a['superPassRepeat']); $sp53a652 = $this->get('config'); $sp53a652->updateParameters($sp58b40a); $sp53a652->updateAppSettings($sp58b40a['appSettings']); ini_set('opcache.enable', 0); $sp53a652->onRegister(); $sp00ac34 = $this->install(); if (!$sp00ac34['success']) { $spb50eec = true; $sp2dc294 = $sp00ac34['message']; return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'dbCreateError' => $spb50eec, 'message' => $sp2dc294)); } $spbbac75 = $this->get('model_validation')->validateDb(); if (count($spbbac75) !== 0) { $spb50eec = true; $sp2dc294 = $spbbac75['message']; return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'dbCreateError' => $spb50eec, 'message' => $sp2dc294)); } $this->get('logger')->info('Application installed'); return $this->render('admin/install-wizard-3.html'); } public function uninstallAction() { return $this->render('admin/uninstall.html'); } public function uninstall2Action() { $spfdfe1b = $this->get('request'); if (!$spfdfe1b->isPost()) { return $this->redirect('Install:uninstall'); } $sp00ac34 = $this->uninstall(); if (!$sp00ac34['success']) { $spa37d93 = true; $spb7cdc7 = $sp00ac34['errorMsg']; return $this->render('admin/uninstall.html', array('error' => $spa37d93, 'errorMsg' => $spb7cdc7)); } $this->get('logger')->info('Application uninstalled'); return $this->render('admin/uninstall-2.html'); } protected function createMemoryFiles() { $sp00ac34 = true; foreach ($this->memoryServices as $sp8de477) { if (!touch($this->get($sp8de477)->getFilePath())) { $sp00ac34 = false; } } return $sp00ac34; } protected function ensureValidConfig() { $spfdfe1b = $this->get('request'); if ($spfdfe1b->isPost()) { $sp58b40a = $spfdfe1b->postVar('config'); $sp27ba6f = $this->get('model_validation'); $spbbac75 = $sp27ba6f->validateInstallConfig($sp58b40a); if (count($spbbac75) !== 0) { return $this->render('admin/install-wizard.html', array('config' => $sp58b40a, 'errors' => $spbbac75)); } } else { return $this->redirect('Install:wizard'); } return null; } protected function install() { $sp128a08 = array('message' => ''); if ($this->get('request')->isPost()) { $sp58b40a = $this->get('config'); try { $spe1394b = file_get_contents(ROOT_DIR . '/../sql/install_' . $sp58b40a->data['dbType'] . '.sql'); $spe1394b = str_replace('%db_name%', $sp58b40a->data['dbName'], $spe1394b); $sp58b40a->data['appSettings']['installed'] = false; $sp128a08['success'] = $this->get('db')->execute($spe1394b); } catch (Exception $spa39607) { $sp128a08['success'] = false; $sp128a08['message'] = $spa39607->getMessage(); } if ($sp128a08['success']) { $sp58b40a->updateAppSettings(array('installed' => true)); $sp128a08 = $this->createAdmin($sp58b40a); if ($sp128a08['success']) { $sp0f91b5 = $sp128a08['admin']; $this->get('auth')->setUser($sp0f91b5->id, $sp0f91b5->name, $sp0f91b5->roles); } } else { if (empty($sp128a08['message'])) { $sp128a08['message'] = $this->get('i18n')->trans('other.error'); } } } return $sp128a08; } protected function createAdmin($sp58b40a) { $sp128a08 = array('message' => ''); $this->get('db')->reconnect(); $sp0f91b5 = UserModel::repo()->findOneBy(array('roles' => array('Like', '%ADMIN%'))); if (!$sp0f91b5) { $sp0f91b5 = new UserModel(array('roles' => array('ADMIN', 'OPERATOR'), 'info' => array('ip' => $this->get('request')->getIp()))); } $sp0f91b5->name = $sp58b40a->data['superUser']; $sp0f91b5->mail = $sp58b40a->data['superUser']; $sp0f91b5->password = $this->get('security')->encodePassword($sp58b40a->data['superPass']); if ($sp0f91b5->save()) { $sp128a08['success'] = true; $sp128a08['admin'] = $sp0f91b5; } else { $sp128a08['success'] = false; $sp128a08['message'] = $this->get('i18n')->trans('admin.update.error'); } return $sp128a08; } protected function uninstall() { $sp128a08 = array(); if ($this->get('request')->isPost()) { $sp58b40a = $this->get('config'); try { $spe1394b = file_get_contents(ROOT_DIR . '/../sql/uninstall_' . $sp58b40a->data['dbType'] . '.sql'); $spe1394b = str_replace('%db_name%', $sp58b40a->data['dbName'], $spe1394b); $sp128a08['success'] = $this->get('db')->execute($spe1394b); } catch (Exception $spa39607) { $sp128a08['success'] = false; $sp128a08['errorMsg'] = $spa39607->getMessage(); } if ($sp128a08['success']) { $spe7c7ec = array('id' => '-1', 'name' => $sp58b40a->data['superUser'], 'roles' => array('ADMIN')); $this->get('auth')->setUser($spe7c7ec['id'], $spe7c7ec['name'], $spe7c7ec['roles']); $sp58b40a = $this->get('config'); $sp58b40a->updateAppSettings(array('installed' => false)); $sp58b40a->updateParameters(array('superPass' => '')); } else { $sp128a08['error'] = $sp128a08['errorMsg'] = $this->get('i18n')->trans('uninstall.error'); } } return $sp128a08; } protected function getJsTranslations() { $spababea = $this->get('i18n'); return array('connection.error' => $spababea->trans('connection.error'), 'invalid.code.format' => $spababea->trans('invalid.code.format'), 'invalid.purchase' => $spababea->trans('invalid.purchase')); } }