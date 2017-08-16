using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Components_LessonMenu_LessonMenuList : System.Web.UI.UserControl
{
    private bool ShowCheckBoxes = false;
    public event EventHandler checkChanged;
    public bool showCheckboxes
    {
        get
        {
            return ShowCheckBoxes;
        }
        set
        {
            ShowCheckBoxes = value;
        }
    }
    public event EventHandler menuClicked;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!this.IsPostBack)
        //{
        //    bindData();
        //}
        if (!IsPostBack)
        {
            TreeView1.Attributes.Add("onclick", "postBackByObject()");
            if (ShowCheckBoxes)
            {
                TreeView1.ShowCheckBoxes = TreeNodeTypes.All;
            }
        }

    }

    public List<int> GetSelectedMenuList()
    {
        List<int> IdList = new List<int>();
        TraverseNodes(TreeView1.Nodes, ref IdList);
        return IdList;
    }
    public void SetCheckBoxes(int parentID)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        TraverseNodes(TreeView1.Nodes, parentID, db);
    }

    public void TraverseNodes(TreeNodeCollection treeView, int Parent_MenuID, DreamBirdEntities db)
    {
        foreach (TreeNode node in treeView)
        {
            if (node.ChildNodes.Count > 0)
            {
                TraverseNodes(node.ChildNodes, Parent_MenuID, db);
            }
            int id = Convert.ToInt32(node.Value);
            if(db.LessonMenuPreRequisites.Any(a => a.menu_id == Parent_MenuID && a.pre_req_menu_id == id))
            {
                node.Checked = true;
            }
            else
            {
                node.Checked = false;
            }
        }
    }

    public void TraverseNodes(TreeNodeCollection treeView, ref List<int> list)
    {
        foreach (TreeNode node in treeView)
        {
            if (node.ChildNodes.Count > 0)
            {
                TraverseNodes(node.ChildNodes, ref list);
            }
            if (node.Checked)
            {
                list.Add(Convert.ToInt32(node.Value));
            }
        }
    }
    public void bindData(int ParentLayoutID)
    {



        ViewState["ParentLayoutID"] = ParentLayoutID;
        TreeView1.Nodes.Clear();
        List<LessonMenu> dt = this.GetData(1, ParentLayoutID);
        this.PopulateTreeView(dt, 1, null, ParentLayoutID);

    }

    public void bindData(int ParentLayoutID, bool isContainer)
    {
        ViewState["ParentLayoutID"] = ParentLayoutID;
        TreeView1.Nodes.Clear();
        List<LessonMenu> dt = this.GetData(1, ParentLayoutID, isContainer);
        this.PopulateTreeView(dt, 1, null, ParentLayoutID, isContainer);
    }

    private void PopulateTreeView(List<LessonMenu> dtParent, int parentId, TreeNode treeNode, int parentLayoutID)
    {
        foreach (LessonMenu row in dtParent)
        {
            TreeNode child = new TreeNode
            {
                Text = row.DisplayName.ToString(),
                Value = row.id.ToString(),
            };
            if (parentId == 1)
            {
                TreeView1.Nodes.Add(child);
                List<LessonMenu> dtChild = this.GetData(int.Parse(child.Value), parentLayoutID);
                PopulateTreeView(dtChild, int.Parse(child.Value), child, parentLayoutID);
            }
            else
            {
                treeNode.ChildNodes.Add(child);
                List<LessonMenu> dtChild = this.GetData(int.Parse(child.Value), parentLayoutID);
                PopulateTreeView(dtChild, int.Parse(child.Value), child, parentLayoutID);
            }
        }
    }

    private void PopulateTreeView(List<LessonMenu> dtParent, int parentId, TreeNode treeNode, int parentLayoutID, bool isContainer)
    {
        foreach (LessonMenu row in dtParent)
        {
            TreeNode child = new TreeNode
            {
                Text = row.DisplayName.ToString(),
                Value = row.id.ToString(),
            };
            if (parentId == 1)
            {
                TreeView1.Nodes.Add(child);
                List<LessonMenu> dtChild = this.GetData(int.Parse(child.Value), parentLayoutID, isContainer);
                PopulateTreeView(dtChild, int.Parse(child.Value), child, parentLayoutID, isContainer);
            }
            else
            {
                treeNode.ChildNodes.Add(child);
                List<LessonMenu> dtChild = this.GetData(int.Parse(child.Value), parentLayoutID, isContainer);
                PopulateTreeView(dtChild, int.Parse(child.Value), child, parentLayoutID, isContainer);
            }
        }
    }
    private List<LessonMenu> GetData(int ParentNode, int parentLayoutID)
    {
        List<LessonMenu> result = new List<LessonMenu>();
        DreamBirdEntities db = new DreamBirdEntities();
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            if (ParentNode == 1)
            {
                if(ShowCheckBoxes)
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == 1 && q.ParentLayoutID == parentLayoutID && q.menuType != "none").OrderBy(o => o.AppOrder).ToList();
                }
                else
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == 1 && q.ParentLayoutID == parentLayoutID).OrderBy(o => o.AppOrder).ToList();
                }
            }
            else
            {
                if (ShowCheckBoxes)
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == ParentNode && q.menuType != "none").OrderBy(o => o.AppOrder).ToList();
                }
                else
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == ParentNode).OrderBy(o => o.AppOrder).ToList();
                }
            }

        }
        return result;


    }

    private List<LessonMenu> GetData(int ParentNode, int parentLayoutID, bool isContainer)
    {
        List<LessonMenu> result = new List<LessonMenu>();
        DreamBirdEntities db = new DreamBirdEntities();
        if (HttpContext.Current.User.Identity.IsAuthenticated)
        {
            if (ParentNode == 1)
            {
                if (ShowCheckBoxes)
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == 1 && q.ParentLayoutID == parentLayoutID && q.menuType != "none" && q.IsContainer == true).OrderBy(o => o.AppOrder).ToList();
                }
                else
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == 1 && q.ParentLayoutID == parentLayoutID && q.IsContainer == true).OrderBy(o => o.AppOrder).ToList();
                }
            }
            else
            {
                if (ShowCheckBoxes)
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == ParentNode && q.menuType != "none" && q.IsContainer == true).OrderBy(o => o.AppOrder).ToList();
                }
                else
                {
                    result = db.LessonMenus.Where(q => q.parentMenu_id == ParentNode && q.IsContainer == true).OrderBy(o => o.AppOrder).ToList();
                }
            }

        }
        return result;


    }

    protected void TreeView1_SelectedNodeChanged(object sender, EventArgs e)
    {
        TreeView node = (TreeView)sender;
        int id = int.Parse(node.SelectedValue);
        EventArgLessonMenuClik evt = new EventArgLessonMenuClik();
        evt.LessonMenuID = id;
        // node.ExpandDepth = 1;
        // node.ExpandAll();
        if(menuClicked != null)
        {
            menuClicked(sender, evt);
        }
        
    }

    protected void setdata(int parentLayoutid, int menu_id)
    {

    }

    protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
    {
        int nodeID = Convert.ToInt32(e.Node.Value);
        EventArgDreamEdit evt = new EventArgDreamEdit();
        evt.DreamEditID = nodeID;
        evt.IsChecked = e.Node.Checked;
        if(checkChanged != null)
        {
            checkChanged(this, evt);
        }
    }
}