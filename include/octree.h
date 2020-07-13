// Theory and Implementation inspired by
// https://www.flipcode.com/archives/Octree_Implementation.shtml
// An Efficient Parametric Algorithm for Octree Traversal by Revelles et .al 
#ifndef OCTREE_H
#define OCTREE_H
#include <vector>
#include <tree.h>
#include <object.h>

class Octree : public Tree
{
private:
    Octree *children[8];
    BBOX bounds;
    std::vector<std::shared_ptr<Object>> primitives;

    int first_node(double tx0, double ty0, double tz0, double txm, double tym, double tzm);
    int new_node(double txm, int x, double tym, int y, double tzm, int z);
    void proc_subtree(double tx0, double ty0, double tz0, double tx1, double ty1, double tz1, Octree *node, std::vector<Octree*> &hit_nodes, std::shared_ptr<Ray> ray);

public:
    Octree(const std::vector<std::shared_ptr<Object>> p, BBOX b, unsigned max_depth = 8, unsigned min_prims = 1, unsigned depth = 0);
    bool intersect_tree(std::shared_ptr<Ray> ray) override;
};

#endif