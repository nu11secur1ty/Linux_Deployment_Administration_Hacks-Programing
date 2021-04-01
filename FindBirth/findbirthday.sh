#!/usr/bin/bash
# @nu11secur1ty
echo "Please give the path of the file which you want to know when he was born"
echo "For example: /path/path/file"
        read kogi
cat > findbirth.java << EOF
//@nu11secur1ty
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.attribute.BasicFileAttributes;

public class findbirth {

    public static void main(String[] args) throws IOException {
        
        String fileName = "$kogi";
        
        File myfile = new File(fileName);
        Path path = myfile.toPath();
        
        BasicFileAttributes fatr = Files.readAttributes(path, 
                BasicFileAttributes.class);
        
        System.out.printf("File creation time: %s%n", fatr.creationTime());
    }
}
EOF
javac findbirth.java
java findbirth
        exit 0;
