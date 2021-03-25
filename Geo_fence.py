from shapely.geometry import Point
from shapely.geometry.polygon import Polygon
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import geopandas as gpd
import os


ZONES = {}
GEO_FENCE_DIR = "Geo_fence_data"


class Zone:
    def __init__(self, name, polygon):
        self.name = name
        self.polygon = polygon
        self.center = polygon.centroid

    def point_in_zone(self, x, y):
        point = Point(x, y)
        return self.polygon.contains(point)

    def dist_point_from_zone(self, x, y):
        point = Point(x, y)
        return self.polygon.exterior.distance(point)


def where_is_point(x, y):
    for zone in ZONES.values():
        polygon = zone.polygon
        is_in = polygon.contains(Point(x, y))
        if is_in:
            return zone.name
        return None


def init_map():
    init_zones()
    BBox = (2.24332, 2.25749, 48.80161, 48.79489)  # subterfuger
    rhu = plt.imread('Geo_fence_data/map.png')

    fig, ax = plt.subplots(figsize=(8, 7))
    ax.set_title('IONISBOT')
    ax.set_xlim(BBox[0], BBox[1])
    ax.set_ylim(BBox[3], BBox[2])
    ax.imshow(rhu, zorder=0, extent=BBox, aspect='equal')
    ax.plot()
    ############################################################
    # add poly

    legends = []
    for zone in ZONES.values():
        color = np.random.rand(3,)
        legends.append(mpatches.Patch(color=color, label=zone.name))

        polygon = zone.polygon
        p = gpd.GeoSeries(polygon)
        p.plot(ax=ax, facecolor=color, edgecolor='none', alpha=0.5)

    plt.legend(handles=legends)
    plt.pause(0.5)
    return ax


def init_zones():
    for subdir, dirs, files in os.walk(GEO_FENCE_DIR):
        for filename in files:
            filepath = subdir + os.sep + filename
            if filepath.endswith(".txt"):
                listofpoint = []
                file = open(filepath, "r")
                for line in file:
                    fields = line.split("\t")
                    listofpoint.append((float(fields[1]), float(fields[0])))
                polygon = Polygon(listofpoint)
                zone_name = filename[:-4]
                ZONES[zone_name] = Zone(zone_name, polygon)


def plot_point(ax, x, y):
    ax.plot(x, y, color='red', marker='o', linestyle='dashed', linewidth=2, markersize=5)
    plt.pause(0.5)
