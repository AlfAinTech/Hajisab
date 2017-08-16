using System;
using System.Collections.Generic;
using System.IO;
using System.IO.Compression;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebGrease.Css.Extensions;

public partial class Components_MultimediaBank_MultimediaBasicInfo : System.Web.UI.UserControl
{
    public event EventHandler BankSaved;
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void save_multimedia_Click(object sender, EventArgs e)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        if(mmbank_id.Value.Equals("0"))
        {
            Multimediabank bank = new Multimediabank();
            bank.Name = mmbank_name.Text;
            bank.Description = mmbank_description.Text;
            bank.DirectoryPath = mmbank_directory_path.Text;
            bank.IndexFilePath = mmbank_index_path.Text;
            db.Multimediabanks.Add(bank);
        }
        else
        {
            int bankID = Convert.ToInt32(mmbank_id.Value);
            Multimediabank bank = db.Multimediabanks.Where(w => w.id == bankID).First();
            bank.Name = mmbank_name.Text;
            bank.Description = mmbank_description.Text;
            bank.DirectoryPath = mmbank_directory_path.Text;
            bank.IndexFilePath = mmbank_index_path.Text;
        }
        db.SaveChanges();
        if (BankSaved != null)
            BankSaved(this, EventArgs.Empty);
    }
    public static void DeleteDirectory(string directory)
    {
        Directory.GetFiles(directory, "*", SearchOption.AllDirectories).ForEach(File.Delete);
        Directory.Delete(directory, true);
    }
    protected void upload_zip_Click(object sender, EventArgs e)
    {
        if(FileUpload1.HasFile)
        {
            if(Path.GetExtension(FileUpload1.FileName).Equals(".zip") || Path.GetExtension(FileUpload1.FileName).Equals(".rar"))
            {
                if (!(mmbank_directory_path.Text.Equals("")))
                {
                    DeleteDirectory(Server.MapPath(mmbank_directory_path.Text));
                }
                string indexFileName = "";
                string DirectoryName = "";
                string mediaPath = HttpContext.Current.Server.MapPath("~/Components/MultimediaBank/Temp/") + FileUpload1.FileName;
                FileUpload1.SaveAs(mediaPath);
                FileUpload1.Dispose();
                var zipFile = ZipFile.OpenRead(mediaPath);
                if(zipFile.Entries.Any(entry => entry.FullName.EndsWith("index.html")))
                {
                    string extension = Path.GetExtension(FileUpload1.FileName);
                    string fileName = "Components/MultimediaBank/Items/" + FileUpload1.FileName;
                    fileName = fileName.Substring(0, fileName.Length - extension.Length);
                    if (!(Directory.Exists(HttpContext.Current.Server.MapPath("~/"+fileName))))
                    {
                        Directory.CreateDirectory(HttpContext.Current.Server.MapPath("~/" + fileName));
                    }
                    using (ZipArchive archive = ZipFile.OpenRead(mediaPath))
                    {
                        foreach (ZipArchiveEntry entry in archive.Entries)
                        {
                            string fullPath = Path.Combine(Path.Combine(Server.MapPath("~/"+fileName), entry.FullName));
                            if (String.IsNullOrEmpty(entry.Name))
                            {
                                Directory.CreateDirectory(fullPath);
                            }
                            else
                            {
                                if (!(entry.FullName.EndsWith(".exe", StringComparison.OrdinalIgnoreCase) || entry.FullName.EndsWith(".msi", StringComparison.OrdinalIgnoreCase) || entry.FullName.EndsWith(".zip", StringComparison.OrdinalIgnoreCase)))
                                {
                                    entry.ExtractToFile(fullPath, true);
                                }
                            }
                        }
                        archive.Dispose();
                    }
                    indexFileName = "../../"+fileName + "/index.html";
                    DirectoryName = "~/"+fileName;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, typeof(Page), "script_alert", "alert('No index.html found in the zip. Please upload a valid multimedia File with index.html in it!');", true);
                    return;
                }
                zipFile.Dispose();
                File.Delete(mediaPath);
                mmbank_index_path.Text = indexFileName;
                mmbank_directory_path.Text = DirectoryName;
                FileGridCS.populateGrid(DirectoryName);
                save_multimedia.Enabled = true;
            }
            
        }
    }

    public void BindData(int id)
    {
        DreamBirdEntities db = new DreamBirdEntities();
        var MultimediaBank = db.Multimediabanks.Where(w => w.id == id).First();
        mmbank_id.Value = MultimediaBank.id.ToString();
        mmbank_name.Text = MultimediaBank.Name;
        mmbank_description.Text = MultimediaBank.Description;
        mmbank_directory_path.Text = MultimediaBank.DirectoryPath;
        mmbank_index_path.Text = MultimediaBank.IndexFilePath;
        FileGridCS.populateGrid(MultimediaBank.DirectoryPath);
        save_multimedia.Enabled = true;
    }
}