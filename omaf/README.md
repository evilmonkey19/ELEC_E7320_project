# OMAF

![](omaf.gif)

The main idea of OMAF is to send only the part of the video that the user is watching. It is a container format that is based on the ISO BMFF (ISO Base Media File Format) and it is used for the delivery of 360º video. It is not yet supported by any browser. It is a standard that is being developed by the MPEG group.

More info in: https://www.hhi.fraunhofer.de/en/departments/vca/technologies-and-solutions/mpeg-omaf.html

There is only one repository in which they have developed parts of the OMAF standard although it is not yet finished. It is in:
[OpenVisualCloud/Immersive-Video-Sample](https://github.com/OpenVisualCloud/Immersive-Video-Sample/tree/master/OMAF-Sample)


## Advantages
- Uses less bandwidth.
- Format is more efficient.
- It is though for 360º video.
- It seems to be integrated in HLS and DASH current main libraries.

## Disadvantages
- Not implemented in any browser yet.
- It is not a standard yet.
- Requires a lot of processing power to be able to play it. (Server side needs 128Gb and Xeon 8280M CPU).