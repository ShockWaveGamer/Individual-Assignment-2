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

## Part 2:
### Edit the empty scene on your project to look like this one:
![image](https://user-images.githubusercontent.com/88565667/228562948-6f85c043-77e0-4a09-9fff-ce813d3c8765.png)

![image](https://user-images.githubusercontent.com/88565667/228311712-a55bd665-f3fd-4ac4-b0fb-06989088fd4c.png)
![Screenshot 2023-03-28 124527](https://user-images.githubusercontent.com/88565667/228311852-07e34c90-f3b6-4982-b3c9-b33e4af5772d.png)

- One modifcation to the water shader I used is to the wave height modifier. Here I normalized the height to be a value either 1 or -1, and then multiplied it by the amplitude to. be able to scale the height later. 

To get the toon shading I changed the lighting model from Lambert to a custom Toon Ramp. 
- ![image](https://user-images.githubusercontent.com/88565667/228312197-d33d7a56-aaee-4e1e-819c-7b91a3d94cd1.png)
- ![image](https://user-images.githubusercontent.com/88565667/228312257-d8e0a8f8-0476-4215-b3b5-9ac2b0fa82b0.png)
- ![image](https://user-images.githubusercontent.com/88565667/228312634-abd720d7-5386-49f9-b483-26dc2e27978a.png)

