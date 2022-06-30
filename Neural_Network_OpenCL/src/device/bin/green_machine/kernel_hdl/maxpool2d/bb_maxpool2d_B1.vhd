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

-- VHDL created from bb_maxpool2d_B1
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

entity bb_maxpool2d_B1 is
    port (
        in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe16_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c1_exe16_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_08_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_i_08_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_input_w : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_16_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_16_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_h : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_im : in std_logic_vector(63 downto 0);  -- ufix64
        in_output_w : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exe121 : out std_logic_vector(31 downto 0);  -- ufix32
        out_c1_exe16 : out std_logic_vector(63 downto 0);  -- ufix64
        out_i_08 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_16 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul22 : out std_logic_vector(31 downto 0);  -- ufix32
        out_mul24 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B1;

architecture normal of bb_maxpool2d_B1 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component bb_maxpool2d_B1_stall_region is
        port (
            in_c0_exe12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_08 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_w : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe121 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B1_branch is
        port (
            in_c0_exe12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe121 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_c1_exe16 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_08 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul22 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_mul24 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exe121 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul22 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_mul24 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B1_merge is
        port (
            in_c0_exe12_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_exe12_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe16_0 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c1_exe16_1 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_08_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_08_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_j_16_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in_1 : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exe12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c1_exe16 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_i_08 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_j_16 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out_1 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal bb_maxpool2d_B1_stall_region_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_c0_exe121 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_c1_exe16 : STD_LOGIC_VECTOR (63 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_i_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_j_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_mul22 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_mul24 : STD_LOGIC_VECTOR (31 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bb_maxpool2d_B1_stall_region_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_branch_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_branch_out_c0_exe121 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_branch_out_c1_exe16 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_branch_out_i_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_branch_out_j_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_branch_out_mul22 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_branch_out_mul24 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_branch_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_branch_out_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_out_c0_exe12 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_out_c1_exe16 : STD_LOGIC_VECTOR (63 downto 0);
    signal maxpool2d_B1_merge_out_i_08 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_merge_out_j_16 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B1_merge_out_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_out_stall_out_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B1_merge_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- maxpool2d_B1_merge(BLACKBOX,20)
    themaxpool2d_B1_merge : maxpool2d_B1_merge
    PORT MAP (
        in_c0_exe12_0 => in_c0_exe12_0,
        in_c0_exe12_1 => in_c0_exe12_1,
        in_c1_exe16_0 => in_c1_exe16_0,
        in_c1_exe16_1 => in_c1_exe16_1,
        in_i_08_0 => in_i_08_0,
        in_i_08_1 => in_i_08_1,
        in_j_16_0 => in_j_16_0,
        in_j_16_1 => in_j_16_1,
        in_stall_in => bb_maxpool2d_B1_stall_region_out_stall_out,
        in_valid_in_0 => in_valid_in_0,
        in_valid_in_1 => in_valid_in_1,
        out_c0_exe12 => maxpool2d_B1_merge_out_c0_exe12,
        out_c1_exe16 => maxpool2d_B1_merge_out_c1_exe16,
        out_i_08 => maxpool2d_B1_merge_out_i_08,
        out_j_16 => maxpool2d_B1_merge_out_j_16,
        out_stall_out_0 => maxpool2d_B1_merge_out_stall_out_0,
        out_stall_out_1 => maxpool2d_B1_merge_out_stall_out_1,
        out_valid_out => maxpool2d_B1_merge_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- bb_maxpool2d_B1_stall_region(BLACKBOX,2)
    thebb_maxpool2d_B1_stall_region : bb_maxpool2d_B1_stall_region
    PORT MAP (
        in_c0_exe12 => maxpool2d_B1_merge_out_c0_exe12,
        in_c1_exe16 => maxpool2d_B1_merge_out_c1_exe16,
        in_i_08 => maxpool2d_B1_merge_out_i_08,
        in_j_16 => maxpool2d_B1_merge_out_j_16,
        in_output_w => in_output_w,
        in_stall_in => maxpool2d_B1_branch_out_stall_out,
        in_valid_in => maxpool2d_B1_merge_out_valid_out,
        out_c0_exe12 => bb_maxpool2d_B1_stall_region_out_c0_exe12,
        out_c0_exe121 => bb_maxpool2d_B1_stall_region_out_c0_exe121,
        out_c1_exe16 => bb_maxpool2d_B1_stall_region_out_c1_exe16,
        out_i_08 => bb_maxpool2d_B1_stall_region_out_i_08,
        out_j_16 => bb_maxpool2d_B1_stall_region_out_j_16,
        out_mul22 => bb_maxpool2d_B1_stall_region_out_mul22,
        out_mul24 => bb_maxpool2d_B1_stall_region_out_mul24,
        out_stall_out => bb_maxpool2d_B1_stall_region_out_stall_out,
        out_valid_out => bb_maxpool2d_B1_stall_region_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- maxpool2d_B1_branch(BLACKBOX,19)
    themaxpool2d_B1_branch : maxpool2d_B1_branch
    PORT MAP (
        in_c0_exe12 => bb_maxpool2d_B1_stall_region_out_c0_exe12,
        in_c0_exe121 => bb_maxpool2d_B1_stall_region_out_c0_exe121,
        in_c1_exe16 => bb_maxpool2d_B1_stall_region_out_c1_exe16,
        in_i_08 => bb_maxpool2d_B1_stall_region_out_i_08,
        in_j_16 => bb_maxpool2d_B1_stall_region_out_j_16,
        in_mul22 => bb_maxpool2d_B1_stall_region_out_mul22,
        in_mul24 => bb_maxpool2d_B1_stall_region_out_mul24,
        in_stall_in_0 => in_stall_in_0,
        in_valid_in => bb_maxpool2d_B1_stall_region_out_valid_out,
        out_c0_exe12 => maxpool2d_B1_branch_out_c0_exe12,
        out_c0_exe121 => maxpool2d_B1_branch_out_c0_exe121,
        out_c1_exe16 => maxpool2d_B1_branch_out_c1_exe16,
        out_i_08 => maxpool2d_B1_branch_out_i_08,
        out_j_16 => maxpool2d_B1_branch_out_j_16,
        out_mul22 => maxpool2d_B1_branch_out_mul22,
        out_mul24 => maxpool2d_B1_branch_out_mul24,
        out_stall_out => maxpool2d_B1_branch_out_stall_out,
        out_valid_out_0 => maxpool2d_B1_branch_out_valid_out_0,
        clock => clock,
        resetn => resetn
    );

    -- out_c0_exe12(GPOUT,21)
    out_c0_exe12 <= maxpool2d_B1_branch_out_c0_exe12;

    -- out_c0_exe121(GPOUT,22)
    out_c0_exe121 <= maxpool2d_B1_branch_out_c0_exe121;

    -- out_c1_exe16(GPOUT,23)
    out_c1_exe16 <= maxpool2d_B1_branch_out_c1_exe16;

    -- out_i_08(GPOUT,24)
    out_i_08 <= maxpool2d_B1_branch_out_i_08;

    -- out_j_16(GPOUT,25)
    out_j_16 <= maxpool2d_B1_branch_out_j_16;

    -- out_mul22(GPOUT,26)
    out_mul22 <= maxpool2d_B1_branch_out_mul22;

    -- out_mul24(GPOUT,27)
    out_mul24 <= maxpool2d_B1_branch_out_mul24;

    -- out_stall_out_0(GPOUT,28)
    out_stall_out_0 <= maxpool2d_B1_merge_out_stall_out_0;

    -- out_stall_out_1(GPOUT,29)
    out_stall_out_1 <= maxpool2d_B1_merge_out_stall_out_1;

    -- out_valid_out_0(GPOUT,30)
    out_valid_out_0 <= maxpool2d_B1_branch_out_valid_out_0;

END normal;
