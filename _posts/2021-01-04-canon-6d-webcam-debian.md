---
title: Using a Canon DSLR as a webcam with Debian/Ubuntu
layout: post
slug: "canon-dslr-webcam-debian-ubuntu"
excerpt: No EOS Webcam Utility on Linux? No problem!
---

The following was tested with a Canon EOS 6D and a ThinkPad X220 running Debian 10 Buster on Linux Kernel 4.19.0-9-amd64. Your mileage may vary depending on your particular configuration, but I expect this to work on a wide range of Canon DSLRs and other Linux distributions.

**1. Install and set up dependencies**

First, we need to install a few packages.

```sh
$ sudo apt-get install gphoto2 v4l2loopback-utils v4l2loopback-dkms ffmpeg build-essential libelf-dev linux-headers-$(uname -r) unzip vlc
```

**2. Connect your camera**

Use the Mini-USB to USB-A cable to connect the DSLR to your computer. Then, turn the camera on, and make sure it's dialed to Photo mode (in Photo mode, I'm able to get ~20fps, but in Video mode, I barely get 4fps).

**3. Start the capture**

One last step before we can start capturing: we need to enable the v4l2 kernel module.

```sh
$ sudo modprobe v4l2loopback
```

Now, let's start the capture using gphoto2 and ffmpeg.

```sh
$ gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video2
```

You may need to tweak the last argument to a different device depending on your configuration. Try using `/dev/video0`, `/dev/video1`, etc. if `/dev/video2` doesn't work.

**4. Watch the feed**

```sh
vlc v4l2:///dev/video2
```

(again, make sure to use the appropriate device)

If you see the image from your camera, you're all set! You should now be able to use this video feed with video conference software (Jitsi Meet, Google Meet, etc.).

Enjoy!
