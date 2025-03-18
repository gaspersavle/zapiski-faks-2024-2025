#use ubuntu 20.04 because we want to use ROS noetic
FROM nvidia/cuda:11.3.1-cudnn8-devel-ubuntu20.04 as gpu 
ARG UID=1000
ARG GID=1000
ARG DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash","-c"]
LABEL maintainer "Gasper Savle <gspersavle13@gmail.com>"


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

RUN echo "deb http://packages.ros.org/ros/ubuntu focal main" > /etc/apt/sources.list.d/ros1-latest.list

ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

ENV ROS_DISTRO noetic


RUN apt update && apt install --no-install-recommends -y \
    software-properties-common \
    build-essential \
    git \
    apt-utils \
    wget \
    libgl1-mesa-glx \
    dirmngr \
    gnupg2 \
    curl \
    neovim \
    libglib2.0-0

ENV ROS_DISTRO noetic
RUN add-apt-repository universe

RUN apt update --fix-missing && apt install -y wget bzip2 ca-certificates zlib1g-dev libncurses5-dev libgdbm-dev \
    libglib2.0-0 libxext6 libsm6 libxrender1 libffi-dev \
    bash-completion

RUN apt update && apt install -y python3-pip
RUN pip3 install --upgrade pip

RUN pip3 install empy jupyter numba==0.56.4 quaternionic shapely nano pycryptodomex install setuptools==49.4.0 gnupg
RUN pip3 install -U rospkg six

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN echo "source /entrypoint.sh" >> /root/.bashrc

RUN apt update && apt install -y python3-pip git
RUN pip3 install --upgrade pip

RUN pip3 install torch==1.11.0+cu113 torchvision==0.12.0+cu113 torchaudio==0.11.0 --extra-index-url https://download.pytorch.org/whl/cu113

RUN pip3 install lap \
    numpy==1.19.5 \
    matplotlib==3.6 \
    Cython==0.29.21 \
    cython_bbox \
    requests \
    colorama

RUN groupadd -g $GID docker
RUN useradd -rm -d /home/docker -s /bin/bash -g docker -G sudo -u $UID docker -p "$(openssl passwd -1 docker)"

RUN touch /home/docker/.sudo_as_admin_successful

RUN echo 'set completion-ignore-case On' >> /etc/inputrc

RUN apt update
ENV CATKIN_WS=/root/catkin_ws
ENV ROS_PYTHON_VERSION=3
WORKDIR $CATKIN_WS/src/
RUN git clone https://github.com/gaspersavle/AlphaROS.git
RUN git config --global core.editor "nvim"
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt clean
RUN apt update --fix-missing
RUN apt install -y ros-noetic-ros-base \
                   python3-rospy \
                   python3-tk \
                   python3-catkin-tools \
                   ros-$ROS_DISTRO-image-transport-plugins \
                   python3-osrf-pycommon \
                   tmux

RUN source /opt/ros/${ROS_DISTRO}/setup.bash
RUN apt install -y ros-${ROS_DISTRO}-cv-bridge ros-${ROS_DISTRO}-vision-opencv --fix-missing

RUN apt update
RUN apt install -y ros-noetic-ros-base \
                   python3-rospy 
RUN source /opt/ros/${ROS_DISTRO}/setup.bash

RUN echo "source /entrypoint.sh" >> /root/.bashrc

ENV PATH=/usr/local/cuda11.1/bin/:$PATH
ENV LD_LIBRARY_PATH=/usr/local/cuda11.1/lib64/:$LD_LIBRARY_PATH
RUN pip install cython
RUN apt-get install libyaml-dev -y
ARG TORCH_CUDA_ARCH_LIST="5.0 6.0 7.0 7.5 8.0 8.6+PTX"
WORKDIR /root/catkin_ws/src/AlphaROS/
RUN python3 setup.py build develop --user

WORKDIR $CATKIN_WS/src/AlphaROS/detector/yolo
RUN mkdir data

# Model utils
WORKDIR CATKIN_WS/src/AlphaROS/detector
RUN mkdir tracker
WORKDIR CATKIN_WS/src/AlphaROS/detector/tracker
RUN mkdir data

WORKDIR /$CATKIN_WS/src/AlphaROS
RUN mkdir output

COPY pret_model $CATKIN_WS/src/AlphaROS/pretrained_models
COPY test_model $CATKIN_WS/src/AlphaROS/detector/tracker/data
COPY test_weights $CATKIN_WS/src/AlphaROS/detector/yolo/data

RUN apt install -y ros-noetic-tf2-py ros-noetic-tf2-tools python3-tf2-geometry-msgs
RUN apt install --reinstall lsb-release

RUN pip3 install requests \
    opencv-contrib-python==4.6.0.66 
RUN pip3 uninstall opencv-python -y

WORKDIR /
RUN wget https://raw.githubusercontent.com/gaspersavle/Helpers/main/entrypoint.sh
COPY ./entrypoint.sh /
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD tail -f /dev/null

