function CWinPanel(oParentContainer){
    var _iWidthBib;
    var _iHeightBib;
    var _oSpriteSheetBib;
    var _oListener;
    
    var _oButSkip;
    var _oWinText;
    var _oContainer;
    var _oParentContainer;
    
    this._init = function(){
        _oContainer = new createjs.Container();
        _oListener = _oContainer.on("click",function(){});
        _oContainer.visible = false;
        _oParentContainer.addChild(_oContainer);
        
        var oBg = createBitmap(s_oSpriteLibrary.getSprite("win_panel"));
        _oContainer.addChild(oBg);
        
        var oSprite = s_oSpriteLibrary.getSprite("bibs");
        _iWidthBib = oSprite.width/4;
        _iHeightBib = oSprite.height/2;
        
        var oData = {
            images: [oSprite],
            // width, height & registration point of each sprite
            frames: {width: _iWidthBib, height: _iHeightBib},
            animations: {bib_0: [0], bib_1: [1],bib_2:[2],bib_3:[3],bib_4:[4],bib_5:[5],bib_6:[6],bib_7:[7]}
        };

        _oSpriteSheetBib = new createjs.SpriteSheet(oData);
        
        _oWinText = new createjs.Text(TEXT_WIN, "30px " + SECONDARY_FONT, "#ffde00");
        _oWinText.textAlign = "center";
        _oWinText.textBaseline = "alphabetic";
        _oWinText.x = CANVAS_WIDTH/2 + 70;
        _oWinText.y = 496;
        _oWinText.lineHeight = 42;
        _oContainer.addChild(_oWinText);
        
        _oButSkip = new CGfxButton(800,510,s_oSpriteLibrary.getSprite("but_skip"),_oContainer);
        _oButSkip.addEventListener(ON_MOUSE_UP,this.onSkip,this);
    };
    
    this.unload = function(){
        _oContainer.off("click",_oListener);
        _oButSkip.unload();
    };
    
    this.show = function(iWin,aWinList,aRank){
        _oWinText.text = TEXT_WIN + "\n"+iWin+TEXT_CURRENCY;

        //ADD HORSE SPRITES
        var iY = 240;
        for(var j=0;j<3;j++){
            var oSpriteA = s_oSpriteLibrary.getSprite("horse_"+(aRank[j]+1)+"_a");
            var oSpriteB = s_oSpriteLibrary.getSprite("horse_"+(aRank[j]+1)+"_b");
            var oData = {
                images: [oSpriteA,oSpriteB],
                // width, height & registration point of each sprite
                "frames": [
                            [1, 1, 249, 191, 0, -56, -19],
                            [252, 1, 307, 193, 0, -8, -19],
                            [561, 1, 308, 196, 0, -4, -16],
                            [1, 199, 307, 198, 0, -2, -14],
                            [310, 199, 306, 201, 0, -1, -11],
                            [618, 199, 307, 205, 0, 0, -7],
                            [1, 406, 305, 209, 0, -1, -3],
                            [308, 406, 304, 211, 0, -3, -1],
                            [614, 406, 301, 209, 0, -8, 0],
                            [1, 619, 295, 207, 0, -17, -2],
                            [298, 619, 295, 204, 0, -19, -5],
                            [595, 619, 301, 203, 0, -21, -8],
                            [1, 1, 284, 200, 1, -35, -11],
                            [287, 1, 293, 198, 1, -31, -14],
                            [582, 1, 306, 196, 1, -20, -16]
                        ],
                animations: {idle: [1,1], anim: [1,14],start:[15],anim_1:[1,14,"anim"],anim_2:[6,14,"anim"],anim_3:[11,14,"anim"]}
            };

            var oSpriteSheet = new createjs.SpriteSheet(oData);
            
            var oHorse = createSprite(oSpriteSheet,"idle",HORSE_WIDTH/2,HORSE_HEIGHT,HORSE_WIDTH,HORSE_HEIGHT);
            oHorse.scaleX = oHorse.scaleY = 0.35;
            oHorse.x = CANVAS_WIDTH/2 + 90;
            oHorse.y = iY;
            _oContainer.addChild(oHorse);
            
            iY += 68;
        }
        
        //ADD WIN LIST
        var iY = CANVAS_HEIGHT/2 -150;
        for(var i=0;i<aWinList.length;i++){
            var iXOffset;
            if(aWinList[i].type === "forecast"){
                var aBibs = aWinList[i].horses;
                var oBib1 = createSprite(_oSpriteSheetBib,"bib_"+aBibs[0],0,0,_iWidthBib,_iHeightBib);
                oBib1.x = 380;
                oBib1.y = iY;
                oBib1.scaleX = oBib1.scaleY = 0.5;
                _oContainer.addChild(oBib1);
                
                var oText = new createjs.Text("X", "20px " + PRIMARY_FONT, "#fff");
                oText.textAlign = "center";
                oText.textBaseline = "middle";
                oText.x = oBib1.x + _iWidthBib*0.5 + 10;
                oText.y = iY +18;
                _oContainer.addChild(oText);
                
                var oBib2 = createSprite(_oSpriteSheetBib,"bib_"+aBibs[1],0,0,_iWidthBib,_iHeightBib);
                oBib2.x = oText.x + 10;
                oBib2.y = iY;
                oBib2.scaleX = oBib2.scaleY = 0.5;
                _oContainer.addChild(oBib2);
                
                iXOffset = oBib2.x + 35;
            }else{
                var oBib1 = createSprite(_oSpriteSheetBib,"bib_"+aWinList[i].horses,0,0,_iWidthBib,_iHeightBib);
                oBib1.x = 380;
                oBib1.y = iY;
                oBib1.scaleX = oBib1.scaleY = 0.5;
                _oContainer.addChild(oBib1);
                
                iXOffset = oBib1.x + 35;
            }
            
            var oTextType = new createjs.Text((aWinList[i].type).toUpperCase(), "16px " + PRIMARY_FONT, "#ffb400");
            oTextType.textAlign = "left";
            oTextType.textBaseline = "alphabetic";
            oTextType.x = iXOffset;
            oTextType.y = iY + 22;
            _oContainer.addChild(oTextType);
            
            var oTextWin = new createjs.Text(TEXT_WIN + ": " + aWinList[i].win + TEXT_CURRENCY, "16px " + PRIMARY_FONT, "#fff");
            oTextWin.textAlign = "left";
            oTextWin.textBaseline = "alphabetic";
            oTextWin.x = oTextType.x +oTextType.getBounds().width + 10;
            oTextWin.y = iY + 22;
            _oContainer.addChild(oTextWin);
            
            iY += 35;
        }
        
        _oContainer.visible = true;
        _oContainer.alpha = 0;
        createjs.Tween.get(_oContainer).wait(1000).to({alpha: 1}, 500,createjs.Ease.cubicOut);
    };
    
    this.onSkip = function(){
        s_oGame.returnInBetPanel();
    };
    
    _oParentContainer = oParentContainer;
    this._init();
}