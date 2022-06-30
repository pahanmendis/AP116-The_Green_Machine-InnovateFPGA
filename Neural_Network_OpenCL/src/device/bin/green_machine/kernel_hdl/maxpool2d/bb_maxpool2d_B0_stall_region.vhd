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

-- VHDL created from bb_maxpool2d_B0_stall_region
-- VHDL created on Tue Jun 28 19:34:36 2022


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

entity bb_maxpool2d_B0_stall_region is
    port (
        in_input_w : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c1_exe1 : out std_logic_vector(63 downto 0);  -- ufix64
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_output_h : in std_logic_vector(31 downto 0);  -- ufix32
        in_output_w : in std_logic_vector(31 downto 0);  -- ufix32
        in_input_h : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_maxpool2d_B0_stall_region;

architecture normal of bb_maxpool2d_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d is
        port (
            in_c0_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_input_h : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_input_w : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d is
        port (
            in_c1_eni1_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c1_eni1_1 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_output_h : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_output_w : in std_logic_vector(31 downto 0);  -- Fixed Point
            out_c1_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c1_exit_1 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component maxpool2d_B0_merge_reg is
        port (
            in_data_in_0 : in std_logic_vector(31 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out_0 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_c1_exit_1 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B0_merge_reg_aunroll_x_out_data_out_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal maxpool2d_B0_merge_reg_aunroll_x_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal maxpool2d_B0_merge_reg_aunroll_x_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_maxpool2d_B0_merge_reg_aunroll_x_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_maxpool2d_B0_merge_reg_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_stall_entry_q : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_stall_entry_b : STD_LOGIC_VECTOR (31 downto 0);
    signal SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_maxpool2d_B0_merge_reg_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- SE_stall_entry(STALLENABLE,45)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= maxpool2d_B0_merge_reg_aunroll_x_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- bubble_join_stall_entry(BITJOIN,36)
    bubble_join_stall_entry_q <= in_global_id_0;

    -- bubble_select_stall_entry(BITSELECT,37)
    bubble_select_stall_entry_b <= STD_LOGIC_VECTOR(bubble_join_stall_entry_q(31 downto 0));

    -- maxpool2d_B0_merge_reg_aunroll_x(BLACKBOX,13)@0
    -- in in_stall_in@20000000
    -- out out_data_out_0@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    themaxpool2d_B0_merge_reg_aunroll_x : maxpool2d_B0_merge_reg
    PORT MAP (
        in_data_in_0 => bubble_select_stall_entry_b,
        in_stall_in => SE_out_maxpool2d_B0_merge_reg_aunroll_x_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_data_out_0 => maxpool2d_B0_merge_reg_aunroll_x_out_data_out_0,
        out_stall_out => maxpool2d_B0_merge_reg_aunroll_x_out_stall_out,
        out_valid_out => maxpool2d_B0_merge_reg_aunroll_x_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_maxpool2d_B0_merge_reg_aunroll_x(STALLENABLE,44)
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg0 <= (others => '0');
            SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg0 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg1 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed0 <= (not (i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_o_stall) and SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg0;
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed1 <= (not (i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_o_stall) and SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid) or SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg1;
    -- Consuming
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_StallValid <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_backStall and SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid;
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_toReg0 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_toReg1 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_StallValid and SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_or0 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed0;
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireStall <= not (SE_out_maxpool2d_B0_merge_reg_aunroll_x_consumed1 and SE_out_maxpool2d_B0_merge_reg_aunroll_x_or0);
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_backStall <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_V0 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg0);
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_V1 <= SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid and not (SE_out_maxpool2d_B0_merge_reg_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_maxpool2d_B0_merge_reg_aunroll_x_wireValid <= maxpool2d_B0_merge_reg_aunroll_x_out_valid_out;

    -- bubble_join_maxpool2d_B0_merge_reg_aunroll_x(BITJOIN,33)
    bubble_join_maxpool2d_B0_merge_reg_aunroll_x_q <= maxpool2d_B0_merge_reg_aunroll_x_out_data_out_0;

    -- bubble_select_maxpool2d_B0_merge_reg_aunroll_x(BITSELECT,34)
    bubble_select_maxpool2d_B0_merge_reg_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_maxpool2d_B0_merge_reg_aunroll_x_q(31 downto 0));

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x(BLACKBOX,11)@1
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@11
    -- out out_c0_exit_1@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x : i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d
    PORT MAP (
        in_c0_eni1_0 => GND_q,
        in_c0_eni1_1 => bubble_select_maxpool2d_B0_merge_reg_aunroll_x_b,
        in_i_stall => SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_backStall,
        in_i_valid => SE_out_maxpool2d_B0_merge_reg_aunroll_x_V0,
        in_input_h => in_input_h,
        in_input_w => in_input_w,
        out_c0_exit_1 => i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_c0_exit_1,
        out_o_stall => i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x(BLACKBOX,12)@1
    -- in in_i_stall@20000000
    -- out out_c1_exit_0@11
    -- out out_c1_exit_1@11
    -- out out_o_stall@20000000
    -- out out_o_valid@11
    thei_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x : i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d
    PORT MAP (
        in_c1_eni1_0 => GND_q,
        in_c1_eni1_1 => bubble_select_maxpool2d_B0_merge_reg_aunroll_x_b,
        in_i_stall => SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_backStall,
        in_i_valid => SE_out_maxpool2d_B0_merge_reg_aunroll_x_V1,
        in_output_h => in_output_h,
        in_output_w => in_output_w,
        out_c1_exit_1 => i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_c1_exit_1,
        out_o_stall => i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x(STALLENABLE,42)
    -- Valid signal propagation
    SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_V0 <= SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_backStall <= in_stall_in or not (SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_and0 <= i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_o_valid;
    SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_wireValid <= i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_o_valid and SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_and0;

    -- bubble_join_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x(BITJOIN,29)
    bubble_join_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_q <= i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_out_c1_exit_1;

    -- bubble_select_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x(BITSELECT,30)
    bubble_select_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_q(63 downto 0));

    -- bubble_join_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x(BITJOIN,25)
    bubble_join_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_q <= i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x(BITSELECT,26)
    bubble_select_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_q(63 downto 0));

    -- dupName_0_sync_out_x(GPOUT,6)@11
    out_c0_exe1 <= bubble_select_i_sfc_c0_entry_maxpool2d_c0_enter_maxpool2d_aunroll_x_b;
    out_c1_exe1 <= bubble_select_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_b;
    out_valid_out <= SE_out_i_sfc_c1_entry_maxpool2d_c1_enter_maxpool2d_aunroll_x_V0;

    -- sync_out(GPOUT,23)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
