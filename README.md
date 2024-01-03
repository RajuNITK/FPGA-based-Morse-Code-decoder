The input in the form of morse code is given to FPGA board using the slide switches by setting it as high for generating a ‘DASH’ and low for ‘DOT’.

The slide switch is used as reset in this project, a negative edge reset is used, which means when
the reset is low, the FPGA boards resets all required output variable values as 0.

The push button is mapped to Clock pulse. As the morse input given to the FPGA board varies in size for every alphabet, the timing issues arises if the inbuilt 50MHz clock is used. Thus, the use of push button as the clock for giving morse input is preffered


INPUT:
	
	When a sequence of morse input is given, the given input gets left shifted by the number of bits of input given. i.e., if 3 times a dot or dash is clicked then, the input get left shifted by 3 values.

	For every input of dot or a dash, the clock pulse given, so that the next input can be given.

	The “data_decoder” module converts the entered input sequence of morse code to text and the output text is stored in a register.

	When “Send data” switch is made high the output present in the register gets displayed on the 7-segment display


OUTPUT:

	The output is the alphabets ranging from A to Z.

	The major output peripherals are VGA monitor display and seven segment monitor display.

	The VGA module is instantiated with the morse output so that it generates a RGB combination for that particular alphabet and shows the output on screen.

	After the display of the alphabet, the “send data” switch is made low and then, the next morse code input given, then again make the “send data” switch high for displaying the next alphabet.

	By repeating this procedure, we can obtain all the 26 alphabets on the monitor screen. 
 





SOFTWARE MODULES
i.	top_mod_morse: (Top module )
This module implements the logic upon which the Morse Code Decoder works and combines rest of the modules to get inputs. It also synchronizes the function of VGA. 

This module instantiates all the other modules present in the code and 

ii.	data_in module 

	this module takes in the morse input by left shifting the input given by user.
	Also, counts the number bits the user is entering, which is helpful for determining which alphabet to map for the sequence of morse entered


iii.	data_decoder module
 
	This module decodes the morse input to text.
	Stores the text into a output register.

iv.	display_project module

	This module is the VGA interface module
	The pixel width, length, color and location on the monitor screen is determined.
	The pixel values for all the 26 Alphabets are coded 
	chooses which output to show on the VGA screen as per user morse input.
