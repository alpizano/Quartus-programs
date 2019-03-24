-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "03/23/2019 19:18:21"
                                                            
-- Vhdl Test Bench template for design  :  alu_32bit
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY alu_32bit_vhd_tst IS
END alu_32bit_vhd_tst;
ARCHITECTURE alu_32bit_arch OF alu_32bit_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ALUControl : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL ALUFlags : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL B : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Result : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT alu_32bit
	PORT (
	A : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	ALUControl : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	ALUFlags : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	B : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Result : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : alu_32bit
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	ALUControl => ALUControl,
	ALUFlags => ALUFlags,
	B => B,
	Result => Result
	);
init : PROCESS                                               
-- variable declarations   
                                  
BEGIN                                                        
 -- hold reset state for 100 ns.
 wait for 100 ns;
 -- insert stimulus here
 
 A <= "00000000011010000100110011101110";
 B <= "00000000000010100111010100011110";
 
 ALUControl <= "00";
 wait for 100 ns;
 ALUControl <= "01";
 wait for 100 ns;
 ALUControl <= "10";
 wait for 100 ns;
 ALUControl <= "11";
 wait for 100 ns;
 ALUControl <= "00";
 wait for 100 ns;
 ALUControl <= "01";
 wait for 100 ns;
 ALUControl <= "10";
 wait for 100 ns;
 ALUControl <= "11";
                     
WAIT;                                                       
END PROCESS init;   
                                        
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations  
                                    
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;  
                                        
END alu_32bit_arch;
