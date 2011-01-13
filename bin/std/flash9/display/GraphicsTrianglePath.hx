package flash.display;

extern class GraphicsTrianglePath implements IGraphicsPath, implements IGraphicsData {
	function new(?vertices : flash.Vector<Float>, ?indices : flash.Vector<Int>, ?uvtData : flash.Vector<Float>, ?culling : TriangleCulling) : Void;
	var culling : TriangleCulling;
	var indices : flash.Vector<Int>;
	var uvtData : flash.Vector<Float>;
	var vertices : flash.Vector<Float>;
}
