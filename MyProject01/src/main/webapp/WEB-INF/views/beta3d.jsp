<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<div style="display: flex; justify-content: space-around;">		
	<h1>Lamborghini SVJ</h1>
	<h1>Color: gray</h1>
	</div>
    <canvas id="webgl" ></canvas>
	
  
    <script src="https://unpkg.com/three@0.128.0/build/three.min.js"></script>
	<script src="https://unpkg.com/three@0.128.0/examples/js/loaders/GLTFLoader.js"></script>
	<script src="https://unpkg.com/three@0.128.0/examples/js/controls/OrbitControls.js"></script>
    <script type="module">
      let scene, camera, renderer, hlight, directionalLight, light, light2, light3, light4, car, controls;
      let canvas = document.getElementById("webgl")

      function init() {
    scene = new THREE.Scene();
    scene.background = new THREE.Color(0xdddddd);
  
    camera = new THREE.PerspectiveCamera(40, window.innerWidth / window.innerHeight, 1, 5000);
    camera.position.set(1,1,8)

    renderer = new THREE.WebGL1Renderer({ canvas: canvas,antialias: true })
    renderer.setSize(window.innerWidth, window.innerHeight);
    document.body.appendChild(renderer.domElement);
    controls = new THREE.OrbitControls(camera, renderer.domElement);
    controls.addEventListener('change', render);
    hlight = new THREE.AmbientLight(0x404040, 10);
  
    scene.add(hlight);
  
  
    light = new THREE.PointLight(0xc4c4c4, 1);
    light.position.set(0, 300, 500);
    scene.add(light);
  
    light2 = new THREE.PointLight(0xc4c4c4, 1);
    light2.position.set(500, 10, -500);
    scene.add(light2);
  
    light3 = new THREE.PointLight(0xc4c4c4, 1);
    light3.position.set(0, 300, -500);
    scene.add(light3);
  
    light4 = new THREE.PointLight(0xc4c4c4, 1);
    light4.position.set(-500, 300, 0);
    scene.add(light4);
  
    let loader = new THREE.GLTFLoader();
    loader.load('${pageContext.request.contextPath}/resources/assets/scene.gltf', function (gltf) {
      console.log(gltf)

      car = gltf.scene.children[0];
      car.scale.set(1,1,1);
      scene.add(gltf.scene);
      animate();
    })
  }
  function render() {
    renderer.render(scene, camera);
  }
  function animate() {
    renderer.render(scene, camera);
    requestAnimationFrame(animate);
  }
  
  
  init();
    </script>
</body>
</html>