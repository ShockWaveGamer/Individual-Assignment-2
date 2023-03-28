# Individual Assignment 2
 
## Define with your own words what deferred and forward rendering are.
- Forward rendering is a linear pipeline where the geometry information is passed through the vertex shader, then the geometry shade, and finally the fragment shader before being rendered to the screen.
- Deferred rendering is very similar however in the fragment shader, it skips applying the lighting information. Later it collects the scene and applies a second pass for the lighting and shading to the resulting fragment information and then renders it to the screen.

![Diagram](https://user-images.githubusercontent.com/88565667/228295700-d5f0fa64-47fb-4f6c-a000-69fd042c661c.png)
- Deferred rendering offsets the task of calculating lighting in the first fragment shader until it has finished a first pass of all geometry in a scene at which poing it will run a second fragment shader focused on lighting the scene.

![image](https://user-images.githubusercontent.com/88565667/228310165-cc42fca3-cb26-486e-9bb7-8b971b59db6d.png)
![image](https://user-images.githubusercontent.com/88565667/228311712-a55bd665-f3fd-4ac4-b0fb-06989088fd4c.png)
- A modifcation to the water shader I used demonstarted in class is the wave height modifier. Here I normalized the height to be a value either 1 or -1, and then multiplied it by the amplitude to. be able to scale the height later. 
