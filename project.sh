#! /usr/bin/bash

function file_management() {
    while : 
        do
            clear
            echo "*************************************************************************************************************************************"
            echo
            echo "                                                             MAIN MENU                              "
            echo
            echo "**************************************************************************************************************************************"
            echo "1.Create a new file."
            echo "2.Add contents in the file."
            echo "3.Re-write the file."
            echo "4.Rename the file."
            echo "5.Copy the contents of the file."
            echo "6.Read the contents of the file."
            echo "7.Delete the file."
            echo "8.Display the files in the directory."
            echo "9.Quit!"
            echo "**************************************************************************************************************************************"
            read -p "Enter your choice : " ch

            case $ch in
            1)  read -p "Enter the new file name with the extension : " file_name
                touch $file_name
                echo "File created!"
                echo "Press a key. . ." ; read
                ;;  
            
            2)  read -p "Enter the file name that you want to open : " file_name
                if [ -e $file_name ] #if file exist..
                then
                    if [ -w $file_name ] #if file has write permission..
                    then
                        echo "Press 'Ctrl+D' to save and close the file."
                        cat >> $file_name
                    else
                        echo "$file_name doesn't have a write permission!"
                        read -p "Do you want to access the file? (y / n) : " question
                        if [ $question = "y" ]
                        then
                            read -sp "Enter the password : " passw
                            if [ "$passw" -eq "$password" ]
                            then
                                chmod +w $file_name
                                sleep 1
                                echo "Enter the contents you want to enter."
                                echo "Press 'Ctrl+D' to save and close the file."
                                cat >> $file_name
                            fi
                        fi
                    fi
                fi
                echo "Press a key. . ." ; read
                ;;
                
            3)  read -p "Enter the file name that you want to open : " file_name
                if [ -e $file_name ]
                then
                    if [ -w $file_name ]
                    then
                        echo "Press 'Ctrl+D' to save and close the file."
                        cat > $file_name
                    else
                        echo "$file_name doesn't have a write permission!"
                        read -p "Do you want to access the file? (y / n) : " question
                        if [ $question = "y" ]
                        then
                            read -sp "Enter the password : " passw
                            if [ "$passw" -eq "$password" ]
                            then
                                chmod +w $file_name
                                sleep 1
                                echo "Enter the contents you want to enter."
                                echo "Press 'Ctrl+D' to save and close the file."
                                cat >> $file_name
                            fi
                        fi
                    fi
                fi
                echo "Press a key. . ." ; read
                ;;
                
            4)  read -p "Enter the file name that you want to rename : " file_name
                if [ -e $file_name ]
                then
                    read -p "Enter the new file name you want : " new_file
                    mv $file_name $new_file
                    echo "File renamed successfully......"
                else
                    echo "$file_name not found!"
                fi
                echo "Press a key . . ." ; read
                ;;
            
            5)  read -p "Enter File name to copy the contents from : " file_name_1
                read -p "Enter File name in which you want to copy data : " file_name_2
                if [ -e $file_name ] #if [ -f $f1 ]
                then
                    cp $file_name_1 $file_name_2
                    echo "File copied..."
                else
                    echo "$file_name_2 does not exist!"
                    read -p "Do you want to create a new file? Yes(y)/No(n) : " question
                    if [ $question = "y" ]
                    then
                        read -p "Enter the new file name with the extension : " file_name
                        touch $file_name
                        echo "File created!"
                    fi
                    cp $file_name_1 $file_name
                    echo "File copied..."
                fi
                echo "Press a key . . ." ; read
                ;;
                
            6)  read -p "Enter the file name you wish to read : " file_name
                if [ -e $file_name ]
                then
                    if [ -r $file_name ]
                    then
                        #IFS = "Internal field generator" used by shell to determine how to do word splitting
                        #Give space after '=' as we're assigning IFS to the space
                        while IFS= read -r line
                        #Another way to give the space
                        #while IFS='' read -r line
                        do
                            echo "$line"
                        done < $file_name
                    else
                        echo "$file_name doesn't have read permission!"
                        read -p "Do you want to access the file? (y / n) : " question
                        if [ $question = "y" ]
                        then
                            read -sp "Enter the password : " passw
                            if [ "$passw" -eq "$password" ]
                            then
                                chmod +r $file_name
                                echo "Reading the contents . . . "
                                sleep 1
                                while IFS= read -r line
                                #Another way to give the space
                                #while IFS='' read -r line
                                do
                                    echo "$line"
                                done < $file_name
                            fi
                        fi
                    fi
                else
                    echo "$file_name does not exist!"
                fi
                echo "Press a key . . ." ; read
                ;;
            7)  read -p "Enter the file name you want to delete : " file_name
                if [ -e $file_name ]
                then
                    if [ -r $file_name ]
                    then
                        if [ -s $file_name ]
                        then
                            read -p "$file_name contains some data in it. Do you wish to delete? Yes(y)/No(n) : " question
                            if [ $question = "y" ]
                            then
                                rm -i $file_name
                            else 
                                echo "$file_name not deleted!"
                            fi
                        else
                            rm -i $file_name
                        fi
                    else
                        echo "$file_name doesn't have a read permission!"
                    fi
                fi
                echo "Press a key . . ." ; read
                ;;
            8)  read -p "Do you want the detailed information of the file? (y / n) : " question
                if [ $question = "y" ]
                then
                    echo
                    echo "Reading the files in the `pwd` . . ."
                    sleep 1 #10 secs delay
                    echo #leaving a line
                    ls -al
                else
                    echo
                    echo "Reading the files in the `pwd` . . ."
                    sleep 1 #10 secs delay
                    echo #leaving a line
                    ls
                fi
                echo "Press a key . . ." ; read
                ;;
            9)  read -p "Do you want to exit? (y/n) : " question
                if [ $question = "y" ]
                then
                    developer
                    sleep 10
                    exit 0
                fi
                echo "Press a key . . ." ; read
                ;;
            esac
    done
}

function developer() {
    echo "**************************************************************************************************************************************"
    echo
    echo "                                                          Developed by                                                                "
    echo "                                               'Devvrat Mungekar' 'Himani Joshi'                                                      "
    echo
    echo "**************************************************************************************************************************************"
}

username=Devvrat
password=123

clear

echo "**************************************************************************************************************************************"
echo
echo "                                               Welcome to Linus File Management System                     "
echo
echo "**************************************************************************************************************************************"
echo
echo "                               It is the secured File Management System developed for user friendliness    "
echo
echo "**************************************************************************************************************************************"
echo
echo "                                         Please provide the Username and Password to SIGN IN               "
echo
echo "**************************************************************************************************************************************"
sleep 1

read -p "Enter the username : " user_name
read -sp "Enter the password to access : " pass_word
echo

if [ "$user_name" = "$username" ]
then
    if [ "$pass_word" -eq "$password" ]
    then
        echo "Logged in!"
        sleep 1
        file_management
    fi
fi