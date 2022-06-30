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

-- VHDL created from dense_B1_merge
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

entity dense_B1_merge is
    port (
        in_add113_0 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_add113_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_arrayidx22_0 : in std_logic_vector(63 downto 0);  -- ufix64
        in_arrayidx22_1 : in std_logic_vector(63 downto 0);  -- ufix64
        in_global_id_05_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_global_id_05_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_02_0 : in std_logic_vector(31 downto 0);  -- ufix32
        in_j_02_1 : in std_logic_vector(31 downto 0);  -- ufix32
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_valid_in_1 : in std_logic_vector(0 downto 0);  -- ufix1
        out_add113 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_arrayidx22 : out std_logic_vector(63 downto 0);  -- ufix64
        out_global_id_05 : out std_logic_vector(31 downto 0);  -- ufix32
        out_j_02 : out std_logic_vector(31 downto 0);  -- ufix32
        out_stall_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out_1 : out std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end dense_B1_merge;

architecture normal of dense_B1_merge is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal add113_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal add113_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal arrayidx22_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal arrayidx22_mux_q : STD_LOGIC_VECTOR (63 downto 0);
    signal global_id_05_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal global_id_05_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal j_02_mux_s : STD_LOGIC_VECTOR (0 downto 0);
    signal j_02_mux_q : STD_LOGIC_VECTOR (31 downto 0);
    signal stall_out_q : STD_LOGIC_VECTOR (0 downto 0);
    signal stall_out_1_specific_q : STD_LOGIC_VECTOR (0 downto 0);
    signal valid_or_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- add113_mux(MUX,2)
    add113_mux_s <= in_valid_in_0;
    add113_mux_combproc: PROCESS (add113_mux_s, in_add113_1, in_add113_0)
    BEGIN
        CASE (add113_mux_s) IS
            WHEN "0" => add113_mux_q <= in_add113_1;
            WHEN "1" => add113_mux_q <= in_add113_0;
            WHEN OTHERS => add113_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_add113(GPOUT,17)
    out_add113 <= add113_mux_q;

    -- arrayidx22_mux(MUX,3)
    arrayidx22_mux_s <= in_valid_in_0;
    arrayidx22_mux_combproc: PROCESS (arrayidx22_mux_s, in_arrayidx22_1, in_arrayidx22_0)
    BEGIN
        CASE (arrayidx22_mux_s) IS
            WHEN "0" => arrayidx22_mux_q <= in_arrayidx22_1;
            WHEN "1" => arrayidx22_mux_q <= in_arrayidx22_0;
            WHEN OTHERS => arrayidx22_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_arrayidx22(GPOUT,18)
    out_arrayidx22 <= arrayidx22_mux_q;

    -- global_id_05_mux(MUX,4)
    global_id_05_mux_s <= in_valid_in_0;
    global_id_05_mux_combproc: PROCESS (global_id_05_mux_s, in_global_id_05_1, in_global_id_05_0)
    BEGIN
        CASE (global_id_05_mux_s) IS
            WHEN "0" => global_id_05_mux_q <= in_global_id_05_1;
            WHEN "1" => global_id_05_mux_q <= in_global_id_05_0;
            WHEN OTHERS => global_id_05_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_global_id_05(GPOUT,19)
    out_global_id_05 <= global_id_05_mux_q;

    -- j_02_mux(MUX,16)
    j_02_mux_s <= in_valid_in_0;
    j_02_mux_combproc: PROCESS (j_02_mux_s, in_j_02_1, in_j_02_0)
    BEGIN
        CASE (j_02_mux_s) IS
            WHEN "0" => j_02_mux_q <= in_j_02_1;
            WHEN "1" => j_02_mux_q <= in_j_02_0;
            WHEN OTHERS => j_02_mux_q <= (others => '0');
        END CASE;
    END PROCESS;

    -- out_j_02(GPOUT,20)
    out_j_02 <= j_02_mux_q;

    -- valid_or(LOGICAL,26)
    valid_or_q <= in_valid_in_0 or in_valid_in_1;

    -- stall_out(LOGICAL,24)
    stall_out_q <= valid_or_q and in_stall_in;

    -- out_stall_out_0(GPOUT,21)
    out_stall_out_0 <= stall_out_q;

    -- stall_out_1_specific(LOGICAL,25)
    stall_out_1_specific_q <= in_valid_in_0 or stall_out_q;

    -- out_stall_out_1(GPOUT,22)
    out_stall_out_1 <= stall_out_1_specific_q;

    -- out_valid_out(GPOUT,23)
    out_valid_out <= valid_or_q;

END normal;
