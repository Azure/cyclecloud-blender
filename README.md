# Blender #

This project installs and configures the Blender 3D Rendering toolkit for batch rendering.
It includes an example cluster template which installs Blender alongside SGE.

See [Blender](https://www.blender.org/) for details and documentation.

**NOTE** This project does not **yet** include a VDI client for the Blender UI.

<!-- markdown-toc start - Don't edit this section. Run M-x markdown-toc-generate-toc again -->
**Table of Contents**

- [Blender](#blender)
    - [Pre-Requisites](#pre-requisites)
    - [Configuring the Project](#configuring-the-project)
    - [Deploying the Project](#deploying-the-project)
    - [Importing the Sample SGE Cluster Template](#importing-the-sample-sge-cluster-template)
    - [Running the Demos](#running-the-demos)

<!-- markdown-toc end -->


## Pre-Requisites ##


This sample requires the following:

  1. The Blender installation binaries for Linux
  
     a. Download the binaries from [Blender Downloads](https://www.blender.org/download/) and place them in the `./blobs/` directory.
     b. If the version is not 2.79b (the project default), then update the version number in the Files list
        in `./project.ini` and in the cluster template: `./templates/blender.txt`
     
  3. CycleCloud must be installed and running.

     a. If this is not the case, see the CycleCloud QuickStart Guide for
        assistance.

  4. The CycleCloud CLI must be installed and configured for use.

  5. You must have access to log in to CycleCloud.

  6. You must have access to upload data and launch instances in your chosen
     Cloud Provider account.

  7. You must have access to a configured CycleCloud "Locker" for Project Storage
     (Cluster-Init and Chef).

  8. Optional: To use the `cyclecloud project upload <locker>` command, you must
     have a Pogo configuration file set up with write-access to your locker.

     a. You may use your preferred tool to interact with your storage "Locker"
        instead.


## Configuring the Project ##


The first step is to configure the project for use with your storage locker:

  1. Open a terminal session with the CycleCloud CLI enabled.

  2. Switch to the blender directory.

  3. Copy the installer to `./blobs`
    * blender-2.79b-linux-glibc219-x86_64.tar.bz2

  4. If the version number is not 2.79b, update the version numbers in `project.ini` and `templates/blender.txt`
    

## Deploying the Project ##


To upload the project (including any local changes) to your target locker, run the
`cyclecloud project upload` command from the project directory.  The expected output looks like
this:

``` bash

   $ cyclecloud project upload my_locker
   Sync completed!

```


**IMPORTANT**

For the upload to succeed, you must have a valid Pogo configuration for your target Locker.


## Importing the Sample SGE Cluster Template ##


To import the cluster:

 1. Open a terminal session with the CycleCloud CLI enabled.

 2. Switch to the Blender directory.

 3. Run ``cyclecloud import_template sge-blender -f templates/blender.txt``.
    The expected output looks like this:
    
    ``` bash
    
    $ cyclecloud import_template SGE-Blender -f templates/blender.txt
    Importing template SGE-Blender....
    ------------------------
    SGE-Blender : *template*
    ------------------------
    Keypair: $Keypair
    Cluster nodes:
        master: off
    Total nodes: 1
    ```


## Running the Demos ##

The project includes several Blender demo scripts.

To use the demos, first download the 3 demos from the Blender project site:
  * (https://download.blender.org/demo/test/benchmark.zip)
  * (https://download.blender.org/demo/test/classroom.zip)
  * (https://download.blender.org/demo/test/pabellon_barcelona_v1.scene_.zip)
  
Stage the downloaded `.zip` files in the ``blobs/examples`` directory, then re-upload the project.

Next, launch the SGE-Blender cluster and wait for it to converge.

Once the cluster is up and ready, log in and stage the examples using the ``fetch`` scripts:

``` bash
$ cyclecloud connect -c blender master
~$ sudo su -
~# cd /mnt/cluster-init/blender/default/files/examples/
~# for SAMPLE in benchmark  classroom  pabellon; do pushd $SAMPLE; ./fetch_sample.sh; popd; done
```

That will stage the data files in the ``/data`` directory.  Each example contains a pipeline submission script : ``submit_pipeline.sh`` which submits a simple animation pipeline.   For example, to render the classroom example:

``` bash
$ sudo su - cluster.user
cluster.user:~$ cd /data/classroom/
cluster.user:/data/classroom$ bash -x submit_pipeline.sh
```

Each example submits a basic 2-stage pipeline:

  1. Render frames
  2. Convert Frames to mp4

# Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.microsoft.com.

When you submit a pull request, a CLA-bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., label, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
