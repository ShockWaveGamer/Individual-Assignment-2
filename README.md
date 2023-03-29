# Individual Assignment 2
## Part 1:
### Define with your own words what deferred and forward rendering are.

- Forward rendering is a linear pipeline where the geometry information is passed through the vertex shader, then the geometry shade, and finally the fragment shader before being rendered to the screen.
- Deferred rendering is very similar however in the fragment shader, it skips applying the lighting information. Later it collects the scene and applies a second pass for the lighting and shading to the resulting fragment information and then renders it to the screen.

### Create a diagram that shows how each of these work and 
their differences
 
![Diagram](https://user-images.githubusercontent.com/88565667/228295700-d5f0fa64-47fb-4f6c-a000-69fd042c661c.png)

### Use the diagram to explain the differences 

- Deferred rendering offsets the task of calculating lighting in the first fragment shader until it has finished a first pass of all geometry in a scene at which poing it will run a second fragment shader focused on lighting the scene. Instead of making multiple calculations to determine the lighting of a scene, we can run one opporation to do so for the entire scene.

I primaraly used the water shader demonstrated in the lectures.

### Provide an example by describing a scene and how it could be implemented employing pseudocode or a flowchart 

You would need to calculate for three basic buffers. Color, Depth, and Surface Normals. You can add more buffers to this opporation for diffrent effects. After you have collected them you put them together additivly. Once all your buffers are accumulated you calculate for scene lighting. For every light you would add the respective reflections to the scene.

![image](https://user-images.githubusercontent.com/88565667/228565457-35bfc72c-cf81-481f-a6b6-a2986f4187d1.png)

## Part 2:
### Edit the empty scene on your project to look like this one:
![image](https://user-images.githubusercontent.com/88565667/228562948-6f85c043-77e0-4a09-9fff-ce813d3c8765.png)
Please keep in mind that you are not being asked to recreate this scene faithfully. You are being asked to create one that is similar. You can explain your decisions on how you decided to tackle this task to ensure the scene resembles the designated one. The scene should present basic movements controlling the ship or the shark. 

![image](https://user-images.githubusercontent.com/88565667/228605733-8867abeb-67e5-4b2f-b9c6-bffae664fac5.png)

### Explain how the shaders were implemented. Explain the modifications done to the shaders and how they differ from the ones given in class and tutorials. If the shader does not present modifications, no points are awarded.  

![Screenshot 2023-03-28 124527](https://user-images.githubusercontent.com/88565667/228311852-07e34c90-f3b6-4982-b3c9-b33e4af5772d.png)

- One modifcation to the water shader I used is to the wave height modifier. Here I normalized the height to be a value either 1 or -1, and then multiplied it by the amplitude to. be able to scale the height later. 

To get the toon shading I changed the lighting model from Lambert to a custom Toon Ramp. 
- ![image](https://user-images.githubusercontent.com/88565667/228312197-d33d7a56-aaee-4e1e-819c-7b91a3d94cd1.png)
- ![image](https://user-images.githubusercontent.com/88565667/228312257-d8e0a8f8-0476-4215-b3b5-9ac2b0fa82b0.png)
- ![image](https://user-images.githubusercontent.com/88565667/228312634-abd720d7-5386-49f9-b483-26dc2e27978a.png)

## Part 3:
### Explain the following code snippet

![image](https://user-images.githubusercontent.com/88565667/228611015-078407d2-3980-4384-aecb-799c9af71b56.png)

This is a script used to blur images using convolution matrices. 
The second paragraph of text conserns Biliniar filtering. 
Followed by adding layers for bloom.

This can be used to impliment depth of field. For situations you need to mimmic near and far sighted vison. 

## Part 4:
![image](https://user-images.githubusercontent.com/88565667/228605733-8867abeb-67e5-4b2f-b9c6-bffae664fac5.png)

- Bloom, added atop the ship with a light on the mast.

Using code similar to the code above. A bloom shader is added by bluring the scene using a convolustion matrix and the increasing the brightness of materials with emisions and surfaces iluminated by lights.

- Shadows, added to the green turf, casting shadows on to the turf behind it.

Using a two pass shader, Applying the shadow caster tag. I collected the direction of the light and reffrenced it with the ShadowAtenuation function. Changed the color of the ground depending on where shadows were and were not. 

## Part 5:

This shadow shader uses a Lambert lighting model to add shadows to objects with the shader. It is designed with the ability to customize the color of the shadows. Comparing the direction of the light source and the shadow's attenuation, shadows are mapped to the surfaces of the models. Then this area is re-colored with the shadow color.

## Part 6:

A vertex extrusion shader is simple. By collecting surface normals one can offset the position of vertecies along those normals in the vertex shaders by manipulating the to make models appeare thicker or thiner. Depending on the detail of the model, this shader can have a shattring effect where a model's surfaces are liffted off of eachother and float sepratly.

