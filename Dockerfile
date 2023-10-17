# Use Miniconda3 as the base image
FROM continuumio/miniconda3:latest

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Copy requirements.txt into the container
COPY requirements.txt /requirements.txt

# Create and activate a Conda environment called taiwan-llama with Python 3.10
RUN conda create -n taiwan-llama python=3.10 -y && \
    echo "source activate taiwan-llama" > ~/.bashrc

# Install the requirements using pip
RUN /bin/bash -c "source activate taiwan-llama && \
    pip install -r /requirements.txt"

# Additional steps if needed
# ...

# Set the default command to run when starting the container
CMD [ "/bin/bash" ]
