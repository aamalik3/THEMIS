<project xmlns="com.autoesl.autopilot.project" name="bulk_HLS" top="bfs">
    <includePaths/>
    <libraryPaths/>
    <Simulation>
        <SimFlow name="csim"/>
    </Simulation>
    <files xmlns="">
        <file name="../../../CCOde_bulk/harness.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCOde_bulk/support.c" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../../../CCOde_bulk/support.h" sc="0" tb="1" cflags=" -Wno-unknown-pragmas" csimflags=" -Wno-unknown-pragmas" blackbox="false"/>
        <file name="../CCOde_bulk/bfs.c" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCOde_bulk/check.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
        <file name="../CCOde_bulk/input.data" sc="0" tb="false" cflags="" csimflags="" blackbox="false"/>
    </files>
    <solutions xmlns="">
        <solution name="bulk_HLS" status="active"/>
    </solutions>
</project>

