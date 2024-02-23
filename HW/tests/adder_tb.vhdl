entity adder_tb is
end entity adder_tb;

architecture behav of adder_tb is

  --  Declaration of the component that will be instantiated.
  component adder is
    port (
      i0 : in bit;
      i1 : in bit;
      ci : in bit;
      s  : out bit;
      co : out bit
    );
  end component;

  --  Specifies which entity is bound with the component.
  for adder_0 : adder use entity work.adder;
  signal i0 : bit;
  signal i1 : bit;
  signal ci : bit;
  signal s  : bit;
  signal co : bit;

begin

  --  Component instantiation.
  adder_0 : component adder
    port map(
      i0 => i0,
      i1 => i1,
      ci => ci,
      s  => s,
      co => co
    );

  --  This process does the real job.
  proc : process is

    type pattern_type is record
      --  The inputs of the adder.
      i0 : bit;
      i1 : bit;
      ci : bit;
      --  The expected outputs of the adder.
      s  : bit;
      co : bit;
    end record pattern_type;

    type pattern_array is array (natural range <>) of pattern_type;

    constant patterns : pattern_array :=
    (
      ('0', '0', '0', '0', '0'),
      ('0', '0', '1', '1', '0'),
      ('0', '1', '0', '1', '0'),
      ('0', '1', '1', '0', '1'),
      ('1', '0', '0', '1', '0'),
      ('1', '0', '1', '0', '1'),
      ('1', '1', '0', '0', '1'),
      ('1', '1', '1', '1', '1')
    );

  begin

    --  Check each pattern.
    for i in patterns'range loop

      --  Set the inputs.
      i0 <= patterns(i).i0;
      i1 <= patterns(i).i1;
      ci <= patterns(i).ci;
      --  Wait for the results.
      wait for 1 ns;
      --  Check the outputs.
      assert s = patterns(i).s
        report "bad sum value"
        severity error;
      assert co = patterns(i).co
        report "bad carry out value"
        severity error;

    end loop;

    assert false
      report "end of test"
      severity note;
    --  Wait forever; this will finish the simulation.
    wait;

  end process proc;

end architecture behav;
