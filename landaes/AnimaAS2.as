/**
 * ...
 * @author Landaes
 */
import com.greensock.*;
import com.greensock.easing.*;
class landaes.AnimaAS2 extends MovieClip
{
	public function AnimaAS2() 
	{
		//Haz nada
	}
	
	//oculta (alpha = 0) todos los movies que vienen en un array
	public function oculta (arr:Array) {
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			mc._alpha = 0;
		}
	}
	
	//Anima movies visibles a no visibles (sólo alpha) todos los movies que vienen en un array
	public function ocultaAnim (arr:Array, retrasoInicial:Number, retrasoCascada:Number, t:Number) {
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 0.5;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			//mc._alpha = 0;
			new TweenMax(mc,t,{_alpha:0, delay:retrasoInicial+(i*retrasoCascada)});
		}
	}
	
	//Anima de IZQUIERDA a DERECHA y alpha a 100 simultáneamente, todos los movies que vienen en un array, recibe parametros:
	//retrasoInicial:Number retraso en que la animación comience
	//retrasoCascada:Number
	//dist:Number
	//t:Number
	public function animaLR(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			mc._alpha = 0;
			mc._x -= dist;
			new TweenMax(mc,t,{_x:mc._x + dist, _alpha:100, delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function animaRL(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			mc._alpha = 0;
			mc._x += dist;
			new TweenMax(mc,t,{_x:mc._x - dist, _alpha:100, delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function animaTB(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			mc._alpha = 0;
			mc._y -= dist;
			new TweenMax(mc,t,{_y:mc._y + dist, _alpha:100, delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function animaBT(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			mc._alpha = 0;
			mc._y += dist;
			new TweenMax(mc,t,{_y:mc._y - dist, _alpha:100, delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function animaLRV(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			new TweenMax(mc,t,{_x:mc._x + dist, _alpha:100 , delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function animaRLV(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			new TweenMax(mc,t,{_x:mc._x - dist, _alpha:100 , delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}
	
	public function animaTBV(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			new TweenMax(mc,t,{_y:mc._y + dist, _alpha:100 , delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function animaBTV(arr:Array, retrasoInicial:Number, retrasoCascada:Number, dist:Number, t:Number) {
		if (isNaN(dist) || undefined) {
			dist = 50;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			new TweenMax(mc,t,{_y:mc._y - dist, _alpha:100 , delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}

	public function escala(arr:Array, from:Number, to:Number, retrasoInicial:Number, retrasoCascada:Number, t:Number) {
		if (isNaN(from) || undefined) {
			from = 0;
		}
		if (isNaN(to) || undefined) {
			to = 100;
		}
		if (isNaN(retrasoInicial) || undefined) {
			retrasoInicial = 0;
		}
		if (isNaN(retrasoCascada) || undefined) {
			retrasoCascada = 0.1;
		}
		if (isNaN(t) || undefined) {
			t = 1;
		}
		for (var i:Number = 0; i<arr.length; i++) {
			var mc:MovieClip = arr[i];
			mc._alpha = 0;
			mc._xscale = from;
			mc._yscale = from;
			new TweenMax(mc,t,{_xscale:to, _yscale:to,_alpha:100, delay:retrasoInicial+(i*retrasoCascada), ease:Elastic.easeOut});
		}
	}


}