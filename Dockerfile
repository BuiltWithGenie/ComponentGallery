FROM julia:1.9
RUN useradd --create-home --shell /bin/bash genie
RUN mkdir /home/genie/app
COPY . /home/genie/app
WORKDIR /home/genie/app
RUN chown -R genie:genie /home/
USER genie
RUN julia -e "using Pkg; Pkg.activate(\".\"); Pkg.instantiate(); "
EXPOSE 8000
EXPOSE 80
ENV JULIA_DEPOT_PATH "/home/genie/.julia"
ENV JULIA_REVISE = "off"
ENV GENIE_ENV "prod"
ENV GENIE_HOST "0.0.0.0"
ENV PORT "8000"
ENV WSPORT "8000"
ENV EARLYBIND "true"
ENTRYPOINT ["/bin/bash", "-c", "if [ -f /sysimg/gallery.so ]; then exec julia --project --sysimage=/sysimg/gallery.so -e 'using GenieFramework; Genie.loadapp(); up(async=false);'; else exec julia --project -e 'using GenieFramework; Genie.loadapp(); up(async=false);'; fi"]


