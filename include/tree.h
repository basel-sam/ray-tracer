#ifndef TREE_H
#define TREE_H
#include <memory>
#include <ray.h>

enum accel_struct
{
	kd, bvh, octree, none
};

class Tree
{
public:
    virtual bool intersect_tree(std::shared_ptr<Ray> ray) = 0;
};

#endif