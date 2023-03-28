# Individual Assignment 2
 
##Define with your own words what deferred and forward rendering are.
- Forward rendering is a linear pipeline where the geometry information is passed through the vertex shader, then the geometry shade, and finally the fragment shader before being rendered to the screen.
- Deferred rendering is very similar however in the fragment shader, it skips applying the lighting information. Later it collects the scene and applies a second pass for the lighting and shading to the resulting fragment information and then renders it to the screen.
