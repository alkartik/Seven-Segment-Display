library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb is
end tb;


architecture sim of tb is

signal d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15,d16 : std_logic :='1' ;
signal an0,an1,an2,an3 : std_logic;
signal ct1,ct2,ct3,ct4,ct5,ct6,ct7 : std_logic;
signal cl: std_logic :='1';
constant cp : time := 20ns;
constant cf : integer := 100e6;
begin
i_tb : entity work.sevenseg(rtl)
--UUT : sevenseg port map (
--b1=>d1,b2=>d2,b3=>d3,b4=>d4,b5=>d5,b6=>d6,b7=>d7,b8=>d8,b9=>d9,b10=>d10,b11=>d11,b12=>d12,b13=>d13,b14=>d14,b15=>d15,b16=>d16,Clk=>cl,a00=>an0,a11=>an1,a22=>an2,a33=>an3,c1=>ct1,c2=>ct2,c3=>ct3,c4=>ct4,c5=>ct5,c6=>ct6,c7=>ct7);
port map (
b1=>d1,b2=>d2,b3=>d3,b4=>d4,b5=>d5,b6=>d6,b7=>d7,b8=>d8,b9=>d9,b10=>d10,b11=>d11,b12=>d12,b13=>d13,b14=>d14,b15=>d15,b16=>d16,Clk=>cl,a00=>an0,a11=>an1,a22=>an2,a33=>an3,c1=>ct1,c2=>ct2,c3=>ct3,c4=>ct4,c5=>ct5,c6=>ct6,c7=>ct7);

cl<= not cl after cp/4;

process is
begin
d1<='1';
wait for 20ns;
d2<='1';
wait for 20ns;
d3<='1';
wait;
end process;
end sim;