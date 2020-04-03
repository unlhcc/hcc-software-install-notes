HCC does not provide a system-wide install of NU-WRF itself.
Instead, we provide a module and config file with all the
dependencies so that a user can compile NU-WRF themselves.

The basic steps are:
1.  `module purge` followed by `module load NUWRF/intel/v9`.
2.  Unzip the NU-WRF package, i.e. `tar -zxvf nu-wrf_v9p3-wrf391-lis72.tgz`
3.  Place the `crane.cfg` file in the unzipped directory.
4.  Place the `set_module_env.bash` file in the `scripts/other/` directory, overwriting the original.
5.  Several source files require patching to build successfully.  Place the `patch.txt` file in the
    top level directory (parallel to `build.sh`) and run the command
    ```
    patch -p1 < patch.txt
    ```
    The patch only needs to be applied once.
6.  The build can take several hours and requires a fair amount of RAM, so start an
    interactive job by running 
    ```
    srun --pty --qos=short --mem=8gb --time=6:00:00 $SHELL
    ```
7.  In the NU-WRF directory, run

    ```
    export NUWRFDIR=$PWD
    ./build.sh -c $PWD/crane.cfg -o cleanfirst PACKAGENAME
    ```

    replacing `PACKAGENAME` with the package you'd like to build.
    Use `all` for all executables without chemistry, and `allchem` for all excutables with chemistry.
    To make debugging in care of error easier, it's recommended to do the build in steps.
    For example, build `lis` first, then `wrf`, and finally `wps`.

    **NOTE**: The build script may return a successful build message even when errors occurred.
    To be certain each step succeeded, check to make sure the expected executables are present.
    If not, check the `make.log` file for errors.
