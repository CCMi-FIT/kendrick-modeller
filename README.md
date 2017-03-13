# OpenPonk-Kendrick modularity

## Installation
Installation process depends on your preferences and experience with Pharo. All options will require following code:

```smalltalk
Metacello new
  baseline: 'OpenPonkModularity';
  repository: 'github://bliznjan/openponk-modularity/repository';
  load.
```

### Easy but slow option
Use this if you are not experienced with Pharo. Loading of code can take many minutes this way.

* Download OpenPonk (alpha stable) for your platform from https://openponk.github.io/#download
* Extract zip archive
* Open Pharo using openponk.sh (Linux/Mac) or OpenPonk.exe (Windows)
* In the image, run the code above this way:
  * Click on background in the Pharo image
  * select Playground
  * copy there code below
  * select the code
  * right click on selected code
  * select Do it
* If there is a Warning window, click Proceed

### Fast option
Use this if you already have a Pharo virtual machine and you don't mind using new Pharo image.

* Download Kendrick beta image from https://ummisco.github.io/kendrick/#install
* Open the image
* In the image, run the code above
* If there is a Warning window, click Proceed

### Custom image option
To load everything needed into any existing or new image, just run the code above.

* In the image, run fthe code above
* If there is a Warning window, click Proceed

### Other options
If you already have a Kendrick or OpenPonk in your image and do not want to replace it by version loaded by code above, you can load just part of required packages be replacing last line ("load.") by...
* If you have Kendrick, but do NOT have OpenPonk
  * replace "load." by "load: #openponk.".
* If you do NOT have Kendrick, but do have OpenPonk
  * replace "load." by "load: #kendrick".
* If you have both Kendrick and OpenPonk
  * replace "load." by "load: #package".

## Opening the application (OpenPonk-Kendrick modularity workbench)
Either
* right click on background
* select OpenPonk-Kendrick modularity

or run following code
```smalltalk
OKWorkbench example
```
