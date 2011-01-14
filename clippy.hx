import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.display.SimpleButton;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.text.TextFormat;
import flash.external.ExternalInterface;

class Clippy {
  // Main
  static function main() {
    var id:String = flash.Lib.current.loaderInfo.parameters.id;
    
    // label
    
    var label:TextField = new TextField();
    var format:TextFormat = new TextFormat("Arial", 13);
    
    label.text = "copy to clipboard";
    label.setTextFormat(format);
    label.textColor = 0x888888;
    label.selectable = false;
    label.x = 67;
    label.width = 103;
    label.y = 6;
    label.visible = false;
    
    flash.Lib.current.addChild(label);
    
    // button
    
    var button:SimpleButton = new SimpleButton();
    button.useHandCursor = true;
    button.upState = flash.Lib.attach("copy_bttn");
    button.overState = flash.Lib.attach("copy_bttn");
    button.downState = flash.Lib.attach("copy_bttn");
    button.hitTestState = flash.Lib.attach("copy_bttn");
    
    button.addEventListener(MouseEvent.MOUSE_UP, function(e:MouseEvent) {
      flash.system.System.setClipboard(ExternalInterface.call("(function(id){
      if(document.getElementById(id)){
        if(document.getElementById(id).tagName == 'INPUT'){
          return(document.getElementById(id).value);
          } else {
          return(document.getElementById(id).innerHTML);
          }
        }else{
          alert('WARN: ' + id + ' Not found ');
        }
          })",id));
      label.text = "copied!";
      label.setTextFormat(format);
    });
    
    button.addEventListener(MouseEvent.MOUSE_OVER, function(e:MouseEvent) {
      label.visible = true;
    });
    
    button.addEventListener(MouseEvent.MOUSE_OUT, function(e:MouseEvent) {
      label.visible = false;
      label.text = "copy to clipboard";
      label.setTextFormat(format);
    });
    
    flash.Lib.current.addChild(button);
  }
}