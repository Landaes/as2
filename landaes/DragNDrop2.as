/**
 * ...
 * @author Landaes
 */
import com.greensock.*;
import com.greensock.easing.*;
class landaes.DragNDrop2 extends MovieClip
{
	private var ap:Array = new Array();
	private var ar:Array = new Array();
	private var aRespondidas:Array = new Array();
	private var buenas:Number = 0;
	public var mc_ganaste:MovieClip;
	public var mc_perdiste:MovieClip;
	public var mc_perdiste_final:MovieClip;
	public var bt_ganaste:MovieClip;
	public var bt_perdiste:MovieClip;
	public var bt_perdiste_final:MovieClip;

	public var zona_hit_a:MovieClip;
	public var zona_hit_b:MovieClip;

	private var aCorrectas_a:Array = new Array();
	private var aCorrectas_b:Array = new Array();
	private var aPosFinales_a:Array = new Array();
	private var aPosFinales_b:Array = new Array();

	private var hits_on_A:Number = 0;
	private var hits_on_B:Number = 0;
	private var maxReps:Number = 0;
	private var intentos:Number = 0;
	
	public function DragNDrop2() 
	{
		
	}
	
	public function crea(d:DragNDrop2, a:Array, b:Array, win:Array, lose:Array, feedbackFinal:Array, callback:Function, callbackMal:Function, maxRepeticiones:Number) {
		trace("CreA2");
		
		mc_ganaste = win[0];
		bt_ganaste = win[1];
		mc_perdiste = lose[0];
		bt_perdiste = lose[1];
		mc_perdiste_final = feedbackFinal[0];
		bt_perdiste_final = feedbackFinal[1];

		trace(mc_ganaste);
		
		mc_ganaste._visible = false;
		bt_ganaste._visible = false;
		mc_perdiste._visible = false;
		bt_perdiste._visible = false;
		mc_perdiste_final._visible = false;
		bt_perdiste_final._visible = false;
		
		bt_ganaste.onRelease = function() {
			d.ocultaTodo();
			//trace("parent: " + this._parent.nextFrame());
			callback();
		};
		
		bt_perdiste.onRelease = function() {
			d.resetea();
		};

		bt_perdiste_final.onRelease = function() {
			d.animaSolito(a,b,callbackMal);
			
		};

		maxReps = maxRepeticiones;

		zona_hit_a = a[0];
		aCorrectas_a = a[1];
		aPosFinales_a = a[2];

		zona_hit_b = b[0];
		aCorrectas_b = b[1];
		aPosFinales_b = b[2];

		var totalDrags:Array = aCorrectas_a.concat(aCorrectas_b);
		
		aRespondidas = new Array();
		for (var i:Number = 0; i < totalDrags.length; i++) 
		{
			aRespondidas.push(false);
			var mc:MovieClip = totalDrags[i];
			mc._name = "preg" + i;
			mc.i = i;
			ap.push([mc, mc._x, mc._y]);
			
			mc.onPress = function() {
				//swapDepths(getNextHighestDepth());
				startDrag(mc);
			};
			
			
			mc.onRelease = mc.onReleaseOutside=function () {
				stopDrag();
				
				if (this.hitTest(_parent.hit_zone_A)) {
					d.aRespondidas[this.i] = true;
					d.verSiEsCorrecta(this, a[1], d);
					d.anima("A", this);
					this.enabled = false;
					d.revisor();
				} else if (this.hitTest(_parent.hit_zone_B)) {
					d.aRespondidas[this.i] = true;
					d.verSiEsCorrecta(this, b[1], d);

					d.anima("B", this);
					this.enabled = false;
					d.revisor();
				} else {
					for (var j:Number=0; j<=totalDrags.length; j++) {
						if (j != this.i) {
							if (this.hitTest(_parent["resp"+j])) {
								d.aRespondidas[this.i] = true;
								new TweenMax(this, 0.2, { _x:_parent["resp" + j]._x, _y:_parent["resp" + j]._y, ease:Linear.easeOut } );
								_parent["resp" + j]._x = 5000;
								this.enabled = false;
								d.revisor();
								return;
							} else {
								//trace("hola Pame");
							}
						}
					}
					//trace("NO TOCA NADA");
					d.vuelvePreg(this);
				}
			}
		}
	}
	private function verSiEsCorrecta(mc:MovieClip, arr:Array, d:DragNDrop2):Void
	{
		//trace("ver si es correcta "+arr);
		for (var i:Number = 0; i < arr.length; i++) 
		{
			//trace("n")
			//trace(mc);
			//trace(arr[i]);
			if(mc === arr[i]){
				d.buenas += 1;
				//trace("hay una buena CTM");
			}
		}
		//
	}
	private function anima(cual:String, mc:MovieClip):Void
	{
		//aPosFinales_a
		//hits_on_A
		if(cual == "A"){
			var mcA = aPosFinales_a[hits_on_A];
			new TweenMax(mc, 0.2, { _x:mcA._x, _y:mcA._y, ease:Linear.easeOut } );
			hits_on_A +=1;
		} else {
			var mcB = aPosFinales_b[hits_on_B];
			new TweenMax(mc, 0.2, { _x:mcB._x, _y:mcB._y, ease:Linear.easeOut } );
			hits_on_B +=1;
		}
	}
	private function ocultaTodo():Void 
	{
		mc_ganaste._visible = false;
		bt_ganaste._visible = false;
		mc_perdiste._visible = false;
		bt_perdiste._visible = false;
		mc_perdiste_final._visible = false;
		bt_perdiste_final._visible = false;
		for (var i:Number = 0; i < ap.length; i++) 
		{
			var mc:MovieClip = ap[i][0];
			mc._visible = false;
			
			var cm:MovieClip = ar[i][0];
			cm._visible = false;
			
		}
	}
	private function resetea():Void 
	{
		buenas = 0;
		hits_on_A = 0;
		hits_on_B = 0;
		mc_ganaste._visible = false;
		bt_ganaste._visible = false;
		mc_perdiste._visible = false;
		bt_perdiste._visible = false;
		mc_perdiste_final._visible = false;
		bt_perdiste_final._visible = false;
		for (var i:Number = 0; i < ap.length; i++) 
		{
			var mc:MovieClip = ap[i][0];
			mc.enabled = true;
			vuelvePreg(mc);
			vuelveResp(ar[i][0]);
		}
		
		for (var j:Number = 0; j < aRespondidas.length; j++) 
		{
			aRespondidas[j] = false;
		}
	}
	private function revisor():Void 
	{
		var k:Number = 0;
		//trace("aRespondidas.length: " + aRespondidas.length);
		for (var i:Number = 0; i < aRespondidas.length; i++) 
		{
			//trace(aRespondidas[i]);
			if (aRespondidas[i]) 
			{
				k += 1;
			}
		}
		//trace("k en revisor:" +k);
		if (k == aRespondidas.length) 
		{
			trace("revisor");
			trace(mc_perdiste);
			if (buenas == aRespondidas.length) {		
				mc_ganaste._visible = true;
				mc_perdiste._visible = false;
				//mc_ganaste.swapDepths(getNextHighestDepth()+1);
				bt_ganaste._visible = true;
				bt_perdiste._visible = false;
				//bt_ganaste.swapDepths(getNextHighestDepth()+2);
			} else if(intentos < maxReps-1){
				intentos+=1;
				mc_ganaste._visible = false;
				mc_perdiste._visible = true;
				//mc_perdiste.swapDepths(getNextHighestDepth()+1);
				bt_ganaste._visible = false;
				bt_perdiste._visible = true;
				//bt_perdiste.swapDepths(getNextHighestDepth()+2);
			} else {
				mc_perdiste_final._visible = true;
				bt_perdiste_final._visible = true;
				//mc_perdiste_final.swapDepths(getNextHighestDepth()+1);
				//bt_perdiste_final.swapDepths(getNextHighestDepth()+2);

			}
		}
	}
	
	private function vuelvePreg(mc:MovieClip) {
		//trace("vuelvePreg " + mc);
		new TweenMax(mc,0.7,{_x:ap[mc.i][1],_y:ap[mc.i][2], ease:Bounce.easeOut});
	}
	private function vuelveResp(mc:MovieClip) {
		//trace("vuelveResp " + mc);
		mc._x = ar[mc.i][1];
		mc._y = ar[mc.i][2];
	}
	private function animaSolito(a:Array, b:Array, callbackMal:Function) {
		mc_perdiste_final._visible = false;
		bt_perdiste_final._visible = false;
		for (var i:Number = 0; i < aCorrectas_a.length; i++) 
		{
			var animAA = aCorrectas_a[i];
			var mcA = aPosFinales_a[i];
			new TweenMax(animAA, 1, { _x:mcA._x, _y:mcA._y, ease:Linear.easeOut, delay:i*0.2 } );
		}
		
		for (var j:Number = 0; j < aCorrectas_b.length; j++) 
		{
			var animBB = aCorrectas_b[j];
			var mcB = aPosFinales_b[j];
			if(j == aCorrectas_b.length-1){
				new TweenMax(animBB, 1, { _x:mcB._x, _y:mcB._y, ease:Linear.easeOut, delay:j*0.2, onComplete:callbackMal } );
			} else {
				new TweenMax(animBB, 1, { _x:mcB._x, _y:mcB._y, ease:Linear.easeOut, delay:j*0.2 } );
			}
			
		}
		//hits_on_A +=1;
	}
	
}