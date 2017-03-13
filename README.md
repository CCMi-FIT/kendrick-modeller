# openponk-modularity

## Installation
Installation process depends on whether you do have and want to use existing Pharo image and whether you have OpenPonk and/or Kendrick in it

### To use new Pharo image, existing image without OpenPonk or Kendrick or if you don't even know what it is
* If you do not have Pharo image already, download Pharo for your platform (Mac/Windows/Linux) from: http://pharo.org/web/download
* Open Pharo (exact steps depend on platform - for Windows it means to extract the archive and run Pharo.exe)
* In the image, run following code
  * Click on background in the Pharo image
  * select Playground
  * copy there code below
  * select the code
  * right click on selected code
  * select Do it
```smalltalk
Metacello new
  baseline: 'OpenPonkModularity';
  repository: 'github://bliznjan/openponk-modularity/repository';
  load.
```
### To use existing image without Kendrick, but with OpenPonk with FSM and Class editor
* In the image, run following code
  * Click on background in the Pharo image
  * select Playground
  * copy there code below
  * select the code
  * right click on selected code
  * select Do it
```smalltalk
Metacello new
  baseline: 'OpenPonkModularity';
  repository: 'github://bliznjan/openponk-modularity/repository';
  load: #kendrick.
```
### To use existing image with Kendrick, but without OpenPonk
* In the image, run following code
  * Click on background in the Pharo image
  * Click on background
  * select Playground
  * copy there code below
  * select the code
  * right click on selected code
  * select Do it
```smalltalk
Metacello new
  baseline: 'OpenPonkModularity';
  repository: 'github://bliznjan/openponk-modularity/repository';
  load: #openponk.
```

## Running it
Either
* right click on background
* select OpenPonk-Kendrick modularity

or run following code
```smalltalk
OKWorkbench example
```
