# Containers Numerical Solver Benchmark for Large Memory Systems
## INTRODUCTION
The benchmark demonstrates the benefit of using high memory per core ratio to be able to run multiple containers concurrently on a single system, in order to achieve high throughput and utilization of overall system resources.
## BENCHMARK DESCRIPTION
The benchmark at hand enables running multiple containers running the open-foam solver, where each container requires peak memory footprint of ~38GB.

On a system with high memory per core ratio, it would be possible to run additional containers concurrently to better utilize all the computer power of a modern server.

## SYSTEM AND BENCHMARK INSTALLATION AND CONFIGURATION
The instructions below assume installation on CentOS 7.3 or newer, but can be easily adjusted to run on other distributions.

### Required packages
The following packages are required to run the benchmark, and can be installed if needed using the following commands:
```
  # sudo yum install git
  # sudo yum install numactl
  # sudo yum install time
```

### Install docker 

See detailed instructions for installing docker at: https://docs.docker.com/install/linux/docker-ce/centos/

To verify that docker is installed and running:

```
  # sudo docker run hello-world
```

This command downloads a test image and runs it in a container. When the container runs, it prints an informational message and exits.

### BENCHMARK CONFIGURATION
1. Get the openfoam Docker image
```
  # docker pull openfoam/openfoam5-paraview54
```

2. Create the base directory for the benchmark in a location with fast I/O (e.g. fast disks, HW/SW-RAID with XFS filesystem)
```
  # mkdir /data
```

3. Obtain the benchmark files and structure from git repository:

```
  # cd /data
  # git clone https://github.com/ScaleMP/containers_openfoam
```

4. Download and extract the simulation file:

```
  # cd $base/containers_openfoam/bench
  # wget TBD
  # tar xf SimpleBenchMarkLarge.tgz
```

5. Edit run script if base directory is different than default:

```
  # cd $base/containers_openfoam
  # vi benchmark.sh
```

Check for the line with:
"base=/data/containers_openfoam"

6. Set permissions correctly so the Docker containers can access and create the necessary files:

```
  # chmod -R 777 $base/containers_openfoam/bench
  # chmod +x $base/containers_openfoam/bench/bench.sh	
  # chmod +x benchmark.sh  
```

## RUNNING THE BENCHMARK
### INITIALIZING THE BENCHMARK
Using the run script (benchmark.sh), located at "$base/containers_openfoam", it is possible to launch multiple concurrent instances of the open-foam container(s).

As a single instance requires ~38GB RAM, it is recommended to run with an increasing number of containers until reaching the point where there is no additional marginal throughput improvement (as explained in more details in the "Collecting Results" section below).

```
  # cd $base/containers_openfoam
  # ./benchmark.sh [number of containers]
```

For first run of the benchmark, it is recommended to perform 1 "cold" run for wamrup, so following runs would experience similar behavior.

```
  # ./benchmark.sh 1
```

Each container/job output to a file under $base/containers_openfoam/results/bench.[num jobs].[tag]/bench.[instance]
for example:
```
/data/containers_openfoam/results/bench.5.3154/bench.1
```
With a valid output similar to the below:

```
#Begin @ 18679
Wed Jan 31 15:59:45 UTC 2018
#End @ 18679
Wed Jan 31 16:05:55 UTC 2018

real    6m14.244s
user    0m0.164s
sys     0m0.073s
```

### COLLECTING RESULTS
As we are interested in the throughtput that can be achieved (i.e. the number of open-foam containers jobs that can complete in 1 hour):

For that, we would calcualte the average runtime per set of concurrent open-foam container jobs, by first collecting the runtime of each job:
```
  # cd $base/containers_openfoam
  # grep real results/bench.[num jobs]/*
```
for example:
```
  # grep real results/bench.5/*
```
And based on that we can calculate the throughput [jobs/hour]:

Throughput [Jobs/Hour] = 3600 / [Avg job runtime] X [Number of Concurrent Jobs/Containers ran]

*THIS SOFTWARE IS PROVIDED BY SCALEMP "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SCALEMP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*








