 package edu.tamu.ctv.controller;

import edu.tamu.ctv.utils.importdata.ImportManager;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FileUploadController {
    private static final Logger logger = LoggerFactory.getLogger((Class)FileUploadController.class);
    @Autowired
    private ImportManager importManager;

    @RequestMapping(value={"/upload"}, method={RequestMethod.GET})
    public String upload(@RequestParam(value="projectId") String projectId, Model model) {
        logger.debug("upload()");
        model.addAttribute("importProjectId", (Object)projectId);
        return "fileupload/upload";
    }

    @RequestMapping(value={"/uploadFile"}, method={RequestMethod.POST})
    public String uploadFileHandler(@RequestParam(value="file") MultipartFile file, @RequestParam(value="projectId") String projectId, RedirectAttributes redirectAttributes) {
        String returnString;
        boolean lFlag;
        block13 : {
            returnString = "";
            MultipartFile uploadedfile = file;
            String name = uploadedfile.getOriginalFilename();
            lFlag = true;
            if (!name.isEmpty() && StringUtils.isNotBlank((CharSequence)projectId)) {
                Long prjId = Long.valueOf(projectId);
                try {
                    byte[] bytes = file.getBytes();
                    String rootPath = System.getProperty("catalina.home");
                    File dir = new File(String.valueOf(rootPath) + File.separator + "tmpFiles" + File.separator + prjId);
                    if (!dir.exists()) {
                        dir.mkdirs();
                    }
                    File lAlreadyPresentFiles = new File(dir.getAbsolutePath());
                    File[] lExistingFileNames = lAlreadyPresentFiles.listFiles();
                    int i = 0;
                    while (i < lExistingFileNames.length) {
                        if (lExistingFileNames[i].getName() != null && lExistingFileNames[i].getName().equals(name)) {
                            redirectAttributes.addFlashAttribute("css", (Object)"error");
                            returnString = "A file with similar file name is already present in the system.\n\n Kindly change the name and try again";
                            lFlag = false;
                        }
                        ++i;
                    }
                    if (lFlag) {
                        File serverFile = new File(String.valueOf(dir.getAbsolutePath()) + File.separator + name);
                        if (serverFile.length() > 50000) {
                            redirectAttributes.addFlashAttribute("css", (Object)"error");
                            returnString = "File size exceeds specified limit.\n Kindly upload a small size file.";
                            return "redirect:/upload?projectId=" + projectId;
                        }
                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                        stream.write(bytes);
                        stream.close();
                        this.parseFile(serverFile, prjId);
                        logger.info("Server File Location=" + serverFile.getAbsolutePath());
                        redirectAttributes.addFlashAttribute("css", (Object)"success");
                        returnString = "You successfully uploaded file" + name + ". File saving is processed successfully.";
                    }
                }
                catch (Exception e) {
                    redirectAttributes.addFlashAttribute("css", (Object)"error");
                    if (lFlag) {
                        returnString = "A file with similar file name is already present in the system.\n\n Kindly change the name and try again";
                        break block13;
                    }
                    returnString = "You failed to upload " + name + " => " + e.getMessage();
                }
            } else if (lFlag) {
                redirectAttributes.addFlashAttribute("css", (Object)"warning");
                returnString = "There is no file to upload";
            } else {
                redirectAttributes.addFlashAttribute("css", (Object)"warning");
                returnString = "You failed to upload " + name + " because the file was empty.";
            }
        }
        redirectAttributes.addFlashAttribute("msg", (Object)returnString);
        if (!lFlag) {
            return "redirect:/upload?projectId=" + projectId;
        }
        return "redirect:/projects/select/" + projectId;
    }

    @RequestMapping(value={"/uploadMultipleFile"}, method={RequestMethod.POST})
    @ResponseBody
    public String uploadMultipleFileHandler(@RequestParam(value="name") String[] names, @RequestParam(value="file") MultipartFile[] files) {
        if (files.length != names.length) {
            return "Mandatory information missing";
        }
        String message = "";
        int i = 0;
        while (i < files.length) {
            MultipartFile file = files[i];
            String name = names[i];
            try {
                byte[] bytes = file.getBytes();
                String rootPath = System.getProperty("catalina.home");
                File dir = new File(String.valueOf(rootPath) + File.separator + "tmpFiles");
                if (!dir.exists()) {
                    dir.mkdirs();
                }
                File serverFile = new File(String.valueOf(dir.getAbsolutePath()) + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                
                stream.close();
                logger.info("Server File Location=" + serverFile.getAbsolutePath());
                message = String.valueOf(message) + "You successfully uploaded file=" + name + "<br />";
            }
            catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
            ++i;
        }
        return message;
    }

    private void parseFile(File serverFile, Long projectId) {
        try {
            this.importManager.setFile(serverFile.getPath());
            this.importManager.setFileName(serverFile.getName());
            this.importManager.setProject(projectId);
            Thread thread = new Thread((Runnable)this.importManager);
            thread.start();
        }
        catch (Exception e) {
            logger.error(e.getMessage(), (Throwable)e);
        }
    }
}
 