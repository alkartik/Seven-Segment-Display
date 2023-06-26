library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sevenseg is
port(
b1 : in std_logic;
b2 : in std_logic;
b3 : in std_logic;
b4 : in std_logic;
b5 : in std_logic;
b6 : in std_logic;
b7 : in std_logic;
b8 : in std_logic;
b9 : in std_logic;
b10 : in std_logic;
b11 : in std_logic;
b12 : in std_logic;
b13 : in std_logic;
b14 : in std_logic;
b15 : in std_logic;
b16 : in std_logic;
Clk : in std_logic;
a00 : out std_logic;
a11 : out std_logic;
a22 : out std_logic;
a33 : out std_logic;
c1 : out std_logic;
c2 : out std_logic;
c3 : out std_logic;
c4 : out std_logic;
c5 : out std_logic;
c6 : out std_logic;
c7 : out std_logic);
end entity;

architecture rtl of sevenseg is

Signal a0 : std_logic := '0';
Signal a1 : std_logic := '1';
Signal a2 : std_logic := '1';
Signal a3 : std_logic := '1';
Signal cntr : integer    := 0 ;
Signal timers : integer := 0 ;
Signal x1 : std_logic ;
Signal x2 : std_logic ;
Signal x3 : std_logic ;
Signal x4 : std_logic ;

begin
process(Clk)
begin
    if rising_edge(Clk) then
        cntr<=cntr+1;
        if cntr=100000 then
            timers<=timers+1;
            if timers=16 then
                timers<=0;
            end if;
            cntr<=0;
        end if;
    end if;
end process;

process(timers)
begin
    if timers<4 then
        a0 <= '0';
        a1<='1';
        a2<='1';
        a3<='1';
        a00<='0';
        a11<='1';
        a22<='1';
        a33<='1';                 
    elsif timers<8 then
        a0<='1';
        a1<='0';
        a2<='1';
        a3<='1';
        a00<='1';
        a11<='0';
        a22<='1';
        a33<='1';
    elsif timers<12 then
        a0<='1';
        a1<='1';
        a2<='0';
        a3<='1';
        a00<='1';
        a11<='1';
        a22<='0';
        a33<='1';        
    elsif timers<=16 then
        a0<='1';
        a1<='1';
        a2<='1';
        a3<='0';
        a00<='1';
        a11<='1';
        a22<='1';
        a33<='0';        
    end if;
end process;

process(a0,a1,a2,a3)
begin
--    if a0='0' then
--        x1<=b1;
--        x2<=b2;
--        x3<=b3;
--        x4<=b4;
--    elsif a1='0' then
--        x1<=b5;
--        x2<=b6;
--        x3<=b7;
--        x4<=b8;
--    elsif a2='0' then
--        x1<=b9;
--        x2<=b10;
--        x3<=b11;
--        x4<=b12;
--    elsif a3='0' then
--        x1<=b13;
--        x2<=b14;
--        x3<=b15;
--        x4<=b16;
--    end if;
x1<=(not a0 and b1) or (not a1 and b5) or (not a2 and b9) or (not a3 and b13);
x2<=(not a0 and b2) or (not a1 and b6) or (not a0 and b10) or (not a0 and b14);
x3<=(not a0 and b3) or (not a1 and b7) or (not a0 and b11) or (not a0 and b15);
x4<=(not a0 and b4) or (not a1 and b8) or (not a0 and b12) or (not a0 and b16);


end process;

process(x1,x2,x3,x4)
begin
c1 <= x1 or x3 or (x2 and x4) or (not x2 and not x4);
c2 <= (not x2) or (not x3 and not x4) or (x3 and x4);
c3 <= x2 or not x3 or x4;
c4 <= (not x2 and not x4) or (x3 and not x4) or (x2 and not x3 and x4) or (not x2 and x3) or x1;
c5 <= (not x2 and not x4) or (x3 and not x4);
c6 <= x1 or (not x3 and not x4) or (x2 and not x3) or (x2 and not x4);
c7 <= x1 or (x2 and not x3) or (not x2 and x3) or (x3 and not x4);
end process;
end rtl;