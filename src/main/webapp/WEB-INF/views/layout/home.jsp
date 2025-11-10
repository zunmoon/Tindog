<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<jsp:include page="/WEB-INF/views/common/config.jsp"></jsp:include>
<style>
#rank-img > img{
	height: 300px;
	width : 300px;
}
</style>
<body class="wrapper">

<!--<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>-->
<jsp:include page="/WEB-INF/views/common/sessionHeader.jsp"></jsp:include>
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>		    
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="img/tindog_main.png" class="d-block w-100" alt="">
		    </div>
		    <div class="carousel-item">
		      <img src="img/main2.png" class="d-block w-100" alt="">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
	</div>
	
	<!-- 주간 인기 댕댕이 시작 -->
    <div class="container-xxl py-5">
        <div class="container">
        	
            <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
          
			<style>
				#shiva3d {		             
		             width: 100%;
		             height:400px;
		             display: inline-block;         		                
	             }
			</style>
				<div id="shiva3d" style="margin-bottom: 30px;">
				<script type="importmap">
      			{
        			"imports": {
       			    "three": "https://unpkg.com/three@0.141.0/build/three.module.js",
          			"GLTFLoader": "https://unpkg.com/three@0.141.0/examples/jsm/loaders/GLTFLoader.js"
					}
      			}
    			</script>
    			<script type="module">
      				import { 
	        			OrbitControls
      				} from "https://cdn.jsdelivr.net/npm/three@0.124/examples/jsm/controls/OrbitControls.js";
	  				import { GLTFLoader } from "GLTFLoader";
      				import * as THREE from "three";
		
					var shiva3d=document.getElementById("shiva3d");
					var CANVAS_WIDTH=500;
					var CANVAS_HEIGHT=400;      

					const scene = new THREE.Scene();

					const sizes = {
    					width: CANVAS_WIDTH,
    					height: CANVAS_HEIGHT
  					};

					const camera = new THREE.PerspectiveCamera(
    					60,
    					sizes.width / sizes.height,
    					0.1,
    					100
					);
  					camera.position.z = 3;
  					scene.add(camera);

					const renderer = new THREE.WebGLRenderer({
    					antialias: true,
  					});
					renderer.setSize(sizes.width, sizes.height);
  					renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
					renderer.setClearColor(new THREE.Color("white"));
  					shiva3d.appendChild(renderer.domElement);

					window.addEventListener("resize", () => {
    
  	  					sizes.width = CANVAS_WIDTH;
    					sizes.height = CANVAS_HEIGHT;
  
    					camera.aspect = sizes.width / sizes.height;
    					camera.updateProjectionMatrix();
  
  	  					renderer.setSize(sizes.width, sizes.height);
    					renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
  					});

					let controls = new OrbitControls(camera, renderer.domElement);
					controls.enableDamping = true;
					controls.rotateSpeed = 0.8;
					controls.enableZoom = false;		
					controls.enableDamping = true;

					const color = 0xFFFFFF;
					const intensity = 3;
					const light = new THREE.AmbientLight(color, intensity);
					scene.add(light);

      				const loader = new GLTFLoader();
      				loader.load("/shiba/scene.gltf", function (gltf) {
        				scene.add(gltf.scene);

        				function animate() {
          					requestAnimationFrame(animate);
          					gltf.scene.rotation.y += 0.01;
          					renderer.render(scene, camera);
							controls.update();
        				}

        			animate();
      			});
    			</script>
    			</div> 
    		</div> 
    			<div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <p class="d-inline-block border rounded-pill py-1 px-4">Top 4</p>
                <h1 style="margin-top: 30px;">인기 댕댕이🐶</h1>
            	</div>
    			 <div class="row g-4">
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="/img/dog1.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>꾸꾸</h5>
                            <p class="text-primary">골든리트리버/1살</p>                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="/img/dog2.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>꽁이</h5>
                            <p class="text-primary">포메라이언/2살</p>                            
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="/img/dog3.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>릴리</h5>
                            <p class="text-primary">말티즈/5살</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                    <div class="team-item position-relative rounded overflow-hidden">
                        <div class="overflow-hidden" id="rank-img">
                            <img class="img-fluid" src="/img/dog4.jpeg" alt="">
                        </div>
                        <div class="team-text bg-light text-center p-4">
                            <h5>새침이</h5>
                            <p class="text-primary">3살/비글</p>                            
                        </div>
                        </div>
                    </div>
                </div>
            </div>
    			                          	  
        </div>
    </div>
</div>
    <div class="homebtn">
    	<button class="hbtn" onclick="location.href='/worldcup'">내 취향 저격 댕댕이 찾으러 가기</button>
    </div>    
<!-- 주간 인기 댕댕이 끝  -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>