package net.systemeD.potlatch2.mapfeatures.editors {

    import net.systemeD.halcyon.connection.*;
    import net.systemeD.potlatch2.mapfeatures.*;
    import flash.display.*;

	public class AccessEditorFactory extends SingleTagEditorFactory {
	    private var includeFoot:Boolean = true;
        private var includeCycle:Boolean = true;
        private var includeMotor:Boolean = true;
        private var includeHorse:Boolean = true;
        
        public function AccessEditorFactory(inputXML:XML) {
            super(inputXML);
            includeFoot = (inputXML.@foot == '' || inputXML.@foot == 'true');
            includeCycle = (inputXML.@cycle == '' || inputXML.@cycle == 'true');
            includeMotor = (inputXML.@motor == '' || inputXML.@motor == 'true');
            includeHorse = (inputXML.@horse == '' || inputXML.@horse == 'true');
        }
        
        override public function areTagsMatching(entity:Entity):Boolean {
            return entity.getTag("access") != null ||
                entity.getTag("foot") != null ||
                entity.getTag("bicycle") != null ||
                entity.getTag("motor_vehicle") != null ||
                entity.getTag("horse") != null;
        }

        override public function createEditorInstance(entity:Entity):DisplayObject {
            var editor:AccessEditor = new AccessEditor();
            editor.factory = this;
            editor.entity = entity;
            return editor;
        }
        
    }

}


