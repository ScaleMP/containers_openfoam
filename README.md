# Containers Numerical Solver Benchmark for Large Memory Systems
## INTRODUCTION
The benchmark demonstrates the benefit of using high memory/core ratio to be able to run multiple containers concurrently on a single system, in order to achieve high throughput and utilization of overall system resources.
## BENCHMARK DESCRIPTION
The benchmark at hand enables running multiple containers running te openfoam solver, where each container requires peak memory footprint of ~38GB.

On a system with high memory/core ratio, it would be possible to run additional containers concurrently to better utilize all the computer power of a modern server.

## SYSTEM AND BENCHMARK INSTALLATION AND CONFIGURATION
The instructions below assume installation on CentOS 7.3 or newer, but can be easily adjusted to run on other distributions.

*THIS SOFTWARE IS PROVIDED BY SCALEMP "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL SCALEMP BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.*


