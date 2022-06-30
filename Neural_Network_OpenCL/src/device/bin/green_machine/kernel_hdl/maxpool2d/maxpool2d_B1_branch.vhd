-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 19.1 (Release Build #670)
-- 
-- Legal Notice: Copyright 2019 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from maxpool2d_B1_branch
-- VHDL created on Tue Jun 28 19:34:37 2022


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity maxpool2d_B1_branch is
    port (
        in_c0_exe12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe121 : in std_logic_vector(31 downto 0);  -- ufix32
        in_c1_exe16 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_08 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_16 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul22 : in std_logic_vector(31 downto 0);  -- ufix32
        in_mul24 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe121 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe16 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_08 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end maxpool2d_B1_branch;

architecture normal of maxpool2d_B1_branch is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- out_c0_exe12(GPOUT,11)
    out_c0_exe12 <= in_c0_exe12;

    -- out_c0_exe121(GPOUT,12)
    out_c0_exe121 <= in_c0_exe121;

    -- out_c1_exe16(GPOUT,13)
    out_c1_exe16 <= in_c1_exe16;

    -- out_i_08(GPOUT,14)
    out_i_08 <= in_i_08;

    -- out_j_16(GPOUT,15)
    out_j_16 <= in_j_16;

    -- out_mul22(GPOUT,16)
    out_mul22 <= in_mul22;

    -- out_mul24(GPOUT,17)
    out_mul24 <= in_mul24;

    -- stall_out(LOGICAL,20)
    stall_out_q <= in_valid_in and in_stall_in_0;

    -- out_stall_out(GPOUT,18)
    out_stall_out <= stall_out_q;

    -- out_valid_out_0(GPOUT,19)
    out_valid_out_0 <= in_valid_in;

END normal;
