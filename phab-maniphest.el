(require 'json)

(setq test-transactions-json "{
  \"201\": [
    {
      \"taskID\": \"201\",
      \"transactionID\": \"19232\",
      \"transactionPHID\": \"PHID-XACT-TASK-mvidgk5tuzz22gs\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Just found a note from @glaw from when this first came in:\n\n> For whomever picks this up:\n>\n> Currently we don't let gdb think the debuggee has exited because otherwise it assumes the session is over. At least, that used to be the case. It would be interesting to see what happens with process-record in this case: perhaps gdb now knows that for record sessions exit doesn't mean the end of the day. In which case we can return WIFEXITED to gdb, rather than what we currently do which is to squash the WIFEXITED and return WIFSTOPPED:SIGINT.\n\nWith process record, GDB does print a prompt when exit() is reached. It expects you to stop at that point, though; if you continue it kills the inferior and loses the recording.\n\nr.c is\n\n```int main(void) { return 0;}```\n\n\n```nbull@everett:~\/undo-code$ gdb r\nGNU gdb (Ubuntu 7.7.1-0ubuntu5~14.04.2) 7.7.1\nCopyright (C) 2014 Free Software Foundation, Inc.\nLicense GPLv3+: GNU GPL version 3 or later <http:\/\/gnu.org\/licenses\/gpl.html>\nThis is free software: you are free to change and redistribute it.\nThere is NO WARRANTY, to the extent permitted by law.  Type \\\"show copying\\\"\nand \\\"show warranty\\\" for details.\nThis GDB was configured as \\\"x86_64-linux-gnu\\\".\nType \\\"show configuration\\\" for configuration details.\nFor bug reporting instructions, please see:\n<http:\/\/www.gnu.org\/software\/gdb\/bugs\/>.\nFind the GDB manual and other documentation resources online at:\n<http:\/\/www.gnu.org\/software\/gdb\/documentation\/>.\nFor help, type \\\"help\\\".\nType \\\"apropos word\\\" to search for commands related to \\\"word\\\"...\nReading symbols from r...(no debugging symbols found)...done.\n(gdb) b main\nBreakpoint 1 at 0x4004f1\n(gdb) r\nStarting program: \/home\/nbull\/undo-code\/r \n\nBreakpoint 1, 0x00000000004004f1 in main ()\n(gdb) record\n(gdb) c\nContinuing.\nThe next instruction is syscall exit_group.  It will make the program exit.  Do you want to stop the program?([y] or n) n\n[Inferior 1 (process 1440) exited normally]\n(gdb) q\nnbull@everett:~\/undo-code$ ```\n\",
      \"authorPHID\": \"PHID-USER-q2xp3jlsyxh565kqlxyv\",
      \"dateCreated\": \"1426784108\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18833\",
      \"transactionPHID\": \"PHID-XACT-TASK-t5hisspxfdjpkti\",
      \"transactionType\": \"priority\",
      \"oldValue\": 100,
      \"newValue\": 10,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1426504027\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18743\",
      \"transactionPHID\": \"PHID-XACT-TASK-pgb26qmpyw5lqgq\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-6835456\",
      \"newValue\": {
        \"newPriority\": \"100\",
        \"newSubpriorityBase\": \"-7048448\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1426261751\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18490\",
      \"transactionPHID\": \"PHID-XACT-TASK-qxstdtns2eugcbp\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"T4463\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425573823\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18489\",
      \"transactionPHID\": \"PHID-XACT-TASK-ee6jlum7lo6egzz\",
      \"transactionType\": \"status\",
      \"oldValue\": \"open\",
      \"newValue\": \"resolved\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425573823\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18488\",
      \"transactionPHID\": \"PHID-XACT-TASK-exxbvw3nvdbmiez\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Yes, conceded - you two are correct. On the understanding that there is another task to deal with the question of the actual text when quitting a loaded session being confusing (process is being killed). What task number is that?\",
      \"authorPHID\": \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
      \"dateCreated\": \"1425571830\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18380\",
      \"transactionPHID\": \"PHID-XACT-TASK-ujt553eb6mcmg25\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"@glaw, have me and Jules convinced you that we can close this now?\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425464593\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18340\",
      \"transactionPHID\": \"PHID-XACT-TASK-qborlwcvuhzgfqg\",
      \"transactionType\": \"priority\",
      \"oldValue\": 60,
      \"newValue\": 100,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425384323\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18335\",
      \"transactionPHID\": \"PHID-XACT-TASK-qftaelcyyy7gjif\",
      \"transactionType\": \"core:customfield\",
      \"oldValue\": null,
      \"newValue\": \"0.5\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425383097\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18327\",
      \"transactionPHID\": \"PHID-XACT-TASK-r6k6uykzey7ea6v\",
      \"transactionType\": \"priority\",
      \"oldValue\": 100,
      \"newValue\": 60,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425382590\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18326\",
      \"transactionPHID\": \"PHID-XACT-TASK-pvsfaikvki5evnu\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"51533494528\",
      \"newValue\": {
        \"newPriority\": \"60\",
        \"newSubpriorityBase\": \"-6900992\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425382590\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18325\",
      \"transactionPHID\": \"PHID-XACT-TASK-qaevjgabkumwegh\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"8583821568\",
      \"newValue\": {
        \"newPriority\": \"100\",
        \"newSubpriorityBase\": \"42943559936\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425382578\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18324\",
      \"transactionPHID\": \"PHID-XACT-TASK-jcc5cwpyyliiued\",
      \"transactionType\": \"core:edge\",
      \"oldValue\": {
        \"PHID-PROJ-iy66amjyhkslwlj6jky6\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-iy66amjyhkslwlj6jky6\"
        },
        \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\"
        }
      },
      \"newValue\": {
        \"PHID-PROJ-a3ammteiermncusplcdn\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-a3ammteiermncusplcdn\"
        },
        \"PHID-PROJ-iy66amjyhkslwlj6jky6\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-iy66amjyhkslwlj6jky6\"
        },
        \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\"
        }
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425382539\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18305\",
      \"transactionPHID\": \"PHID-XACT-TASK-qtnh3rbe5jxfmol\",
      \"transactionType\": \"core:customfield\",
      \"oldValue\": null,
      \"newValue\": \"- Agree what remain to be done\n- Implement\n- Code review\n- Implement any changes\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425381898\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18279\",
      \"transactionPHID\": \"PHID-XACT-TASK-hp5gawo3jacpyzw\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"For what it's worth, i agree with Finn, that we should keep the current behaviour. Even when debugging a recording,the user may have set up breakpoints and watchpoints that they don't want to lose by mistake, and have bookmarks too. So a `y\/n?` confirmation still makes sense i think.\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425298831\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18276\",
      \"transactionPHID\": \"PHID-XACT-TASK-v2b47kvmebdeney\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"From email discussion over the weekend:\n\n>@nbull said:\n> Regarding the first point, Andrew already knows about 'set confirm off'.  The original request was merely that it would be nice to match GDB's behaviour. Implicitly he doesn't care about accidentally quitting if the debuggee exits.\n\n>@fgrimwood said:\n> Regarding the second, is it really worth being inconsistent for such a minor benefit? I know inconsistent user interfaces are something that really annoys me!\n\n\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425292472\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18216\",
      \"transactionPHID\": \"PHID-XACT-TASK-6lhu6q3fywm2e5e\",
      \"transactionType\": \"title\",
      \"oldValue\": \"Suppress confirmation prompts when the end of the application  (3818)\",
      \"newValue\": \"Suppress confirmation prompts when quitting a loaded session (3818)\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
      \"dateCreated\": \"1425136291\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18215\",
      \"transactionPHID\": \"PHID-XACT-TASK-pwesmdvs5fzrc7y\",
      \"transactionType\": \"core:edge\",
      \"oldValue\": {
        \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\"
        }
      },
      \"newValue\": {
        \"PHID-PROJ-iy66amjyhkslwlj6jky6\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-iy66amjyhkslwlj6jky6\"
        },
        \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\"
        }
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
      \"dateCreated\": \"1425136265\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18214\",
      \"transactionPHID\": \"PHID-XACT-TASK-kavd5iy45ryz3hp\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Sorry to be a pain - I have reopened, because I think there are two things that need to be considered here:\n\n1. Has anyone got in touch with Andrew Calcutt to tell him he can just issue a 'set confirm off'?\n\n 2. It would be good to suppress the confirmation when quitting a loaded session as there is much less for the developer to lose, and also the notion of killing a process in this context is liable to be confusing and so crappy UX. I presume this would be a very small change to the patch, and so worth reinstating the patch but only have it effective on a loaded session.\",
      \"authorPHID\": \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
      \"dateCreated\": \"1425136233\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18213\",
      \"transactionPHID\": \"PHID-XACT-TASK-oxwkawxzao7tjgd\",
      \"transactionType\": \"status\",
      \"oldValue\": \"wontfix\",
      \"newValue\": \"open\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
      \"dateCreated\": \"1425135891\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18208\",
      \"transactionPHID\": \"PHID-XACT-TASK-bfq3gbfyjhvn75f\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Ah, cool, that all makes sense. Thanks.\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425054102\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18207\",
      \"transactionPHID\": \"PHID-XACT-TASK-tnok5tkhizcfuqs\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"We talked about a command line param in the office. The general feeling was that the customer has the `set confirm off` work around if they want it so there isn't much to be gained from adding an option, maybe we should document the difference in behaviour though.\n\nI'm not sure how we can make sure to catch stuff like this either. I'll bring it up at the end of cycle review and see if anyone has any clever ideas.\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425053787\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18198\",
      \"transactionPHID\": \"PHID-XACT-TASK-qktzdxhxujma6qq\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-6376704\",
      \"newValue\": {
        \"newPriority\": \"100\",
        \"newSubpriorityBase\": \"-6113024\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1425053351\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18195\",
      \"transactionPHID\": \"PHID-XACT-TASK-bqic3tuhnhi5hqc\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"BTW, is it worth implementing my suggestion for a command-line param that enables this 'no prompt' behaviour ? This would allow the original customer to get their scripts working ?\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425052545\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18194\",
      \"transactionPHID\": \"PHID-XACT-TASK-hpgivbtcd3ea5ea\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Thanks.\n\nApologies for not noticing this ticket earlier. It's only today when i have a bit of time to catch up on emails that i noticed it.\n\nI'm not sure how we can improve here - sometimes only one person has some required knowledge, but we probably don't want to try to get everyone involved in every task. Perhaps it's most efficient overall to accept that sometimes work has to be fixed up or perhaps reverted.\n\nBut of course if anyone can suggest an improvement here, that would be great.\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425052436\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18188\",
      \"transactionPHID\": \"PHID-XACT-TASK-qdthmrqiwvhgasm\",
      \"transactionType\": \"edge\",
      \"oldValue\": {
        \"PHID-CMIT-j57klfbnbtfh3kozoofo\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": \"1\",
          \"dst\": \"PHID-CMIT-j57klfbnbtfh3kozoofo\",
          \"dateCreated\": \"1425032683\",
          \"seq\": \"0\",
          \"dataID\": null,
          \"data\": []
        }
      },
      \"newValue\": {
        \"PHID-CMIT-gnkben6wmd5brujhkjwv\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": \"1\",
          \"dst\": \"PHID-CMIT-gnkben6wmd5brujhkjwv\",
          \"dateCreated\": \"1425051217\",
          \"seq\": \"0\",
          \"dataID\": null,
          \"data\": []
        },
        \"PHID-CMIT-j57klfbnbtfh3kozoofo\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": \"1\",
          \"dst\": \"PHID-CMIT-j57klfbnbtfh3kozoofo\",
          \"dateCreated\": \"1425032683\",
          \"seq\": \"0\",
          \"dataID\": null,
          \"data\": []
        }
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425051217\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18187\",
      \"transactionPHID\": \"PHID-XACT-TASK-ks5olyasqg3js4b\",
      \"transactionType\": \"status\",
      \"oldValue\": \"open\",
      \"newValue\": \"wontfix\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425051190\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18186\",
      \"transactionPHID\": \"PHID-XACT-TASK-a7b3kiln42t2wvm\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Yes, that's a fair point. I'll revert this changeset.\n\nAs a general process related note - I think it's important to mention stuff like this as soon as possible. This bug should have been closed before it was ever prioritised.\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425050801\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18185\",
      \"transactionPHID\": \"PHID-XACT-TASK-ce35fbacpfs2a4u\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"We cannot match gdb behaviour because undodb is different from gdb - the debugging session does not stop when the debuggee terminates.\n\nThis change could potentially result in users losing hours of work, so i don't think it's safe.\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425049844\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18184\",
      \"transactionPHID\": \"PHID-XACT-TASK-johwfy25fzlkcgu\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Wasn't the original bug that we don't match GDB's behaviour? This change makes us match GDB. It only squashes the prompt if the debuggee has 'exited' (i.e. called `exit()` or returned from `main()`) - most of the time the prompt is still there.\n\nIf the user wants to change the behaviour in their scripts they can just call `set confirm off` in their scripts. This person who reported this specifically wanted us to match GDB.\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425047388\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18183\",
      \"transactionPHID\": \"PHID-XACT-TASK-sdxzwji7su7x4jy\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"To address the original bug, i think we should instead have a new command-line option which activates the 'quit immediately if terminated' behaviour, for use by this customer's scripts.\n\nWe could also perhaps modify things so that the immediate quit only occurs if the debuggee is also in record mode, though this is perhaps less important.\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425044810\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18182\",
      \"transactionPHID\": \"PHID-XACT-TASK-aosk5gzwflbog6g\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Is this change really such a good idea ? The prompt is used by gdb to help avoid the user mistakenly exiting when the debuggee is still running and so losing what might be a very important debugging session. However with undodb, the debugging session is active whether or not the debuggee has terminated.\n\nSo undodb exiting immediately in response to `q<return>` could lose a vital debugging session and possibly cause immense frustration sometimes.\n\",
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425044634\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18181\",
      \"transactionPHID\": \"PHID-XACT-TASK-jyjqqvjzdk5utbb\",
      \"transactionType\": \"status\",
      \"oldValue\": \"resolved\",
      \"newValue\": \"open\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-h2ny6dhiqauu2vqyulye\",
      \"dateCreated\": \"1425044634\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18174\",
      \"transactionPHID\": \"PHID-XACT-TASK-rzwtdgvmvjjk2ng\",
      \"transactionType\": \"status\",
      \"oldValue\": \"open\",
      \"newValue\": \"resolved\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425038016\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18173\",
      \"transactionPHID\": \"PHID-XACT-TASK-thk2egipozq7ket\",
      \"transactionType\": \"reassign\",
      \"oldValue\": null,
      \"newValue\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425038010\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18172\",
      \"transactionPHID\": \"PHID-XACT-TASK-xa7wdoutf3volfl\",
      \"transactionType\": \"priority\",
      \"oldValue\": 60,
      \"newValue\": 100,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425037999\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18166\",
      \"transactionPHID\": \"PHID-XACT-TASK-mgaizqzgv7n3lin\",
      \"transactionType\": \"edge\",
      \"oldValue\": [],
      \"newValue\": {
        \"PHID-CMIT-j57klfbnbtfh3kozoofo\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": \"1\",
          \"dst\": \"PHID-CMIT-j57klfbnbtfh3kozoofo\",
          \"dateCreated\": \"1425032683\",
          \"seq\": \"0\",
          \"dataID\": null,
          \"data\": []
        }
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1425032683\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18040\",
      \"transactionPHID\": \"PHID-XACT-TASK-afuldefjzt5osis\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"Nick confirmed that it is the above issue. In normal GDB land, if the debuggee calls exit() there is no prompt, but because we keep the debuggee running we display the prompt.\n\nThe solution is to suppress the prompt if we are at the end of recorded history and the debuggee has returned an exit code.\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1424961142\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18039\",
      \"transactionPHID\": \"PHID-XACT-TASK-xh3mf2hqnxxtkc7\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"@nbull\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1424960935\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"18038\",
      \"transactionPHID\": \"PHID-XACT-TASK-lk4ggufbj3pwkw2\",
      \"transactionType\": \"core:subscribers\",
      \"oldValue\": [
        \"PHID-USER-asa2yo6hrxumlby23jgs\",
        \"PHID-USER-h2ny6dhiqauu2vqyulye\",
        \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
        \"PHID-USER-sghrh2czfimlokkc7smz\"
      ],
      \"newValue\": [
        \"PHID-USER-asa2yo6hrxumlby23jgs\",
        \"PHID-USER-h2ny6dhiqauu2vqyulye\",
        \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
        \"PHID-USER-sghrh2czfimlokkc7smz\",
        \"PHID-USER-q2xp3jlsyxh565kqlxyv\"
      ],
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1424960935\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"17986\",
      \"transactionPHID\": \"PHID-XACT-TASK-ravlzzqwshbsxq7\",
      \"transactionType\": \"core:comment\",
      \"oldValue\": null,
      \"newValue\": null,
      \"comments\": \"@jsmith @glaw\n\nDoes anyone know what prompt this is? It's not obvious to me, is it the \n\n```(undodb-gdb) q\n\n\tInferior 1 [process 8960] will be killed.\n\nQuit anyway? (y or n) y```\n\none? `set confirm off` just disables all prompts.\",
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1424881976\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"17985\",
      \"transactionPHID\": \"PHID-XACT-TASK-jo3qlhd5z7ooocz\",
      \"transactionType\": \"core:subscribers\",
      \"oldValue\": [
        \"PHID-USER-asa2yo6hrxumlby23jgs\"
      ],
      \"newValue\": [
        \"PHID-USER-asa2yo6hrxumlby23jgs\",
        \"PHID-USER-h2ny6dhiqauu2vqyulye\",
        \"PHID-USER-vxsy2fmxlhtvrw7oauly\",
        \"PHID-USER-sghrh2czfimlokkc7smz\"
      ],
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1424881976\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"17730\",
      \"transactionPHID\": \"PHID-XACT-TASK-5hrhrd6fkzzfd54\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-6114048\",
      \"newValue\": {
        \"newPriority\": 60,
        \"newSubpriorityBase\": null,
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1424269698\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"17728\",
      \"transactionPHID\": \"PHID-XACT-TASK-a632tweydqegtcj\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-6113280\",
      \"newValue\": {
        \"newPriority\": \"60\",
        \"newSubpriorityBase\": \"-6114560\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1424269653\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"17727\",
      \"transactionPHID\": \"PHID-XACT-TASK-sccwosrgssb36v2\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-6112512\",
      \"newValue\": {
        \"newPriority\": \"60\",
        \"newSubpriorityBase\": \"-6113536\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1424269650\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"17720\",
      \"transactionPHID\": \"PHID-XACT-TASK-xnnlleuaqzjviep\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-4945664\",
      \"newValue\": {
        \"newPriority\": \"60\",
        \"newSubpriorityBase\": \"-6114560\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1424269466\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"15551\",
      \"transactionPHID\": \"PHID-XACT-TASK-4exv4xjycpb3pfj\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"-2473472\",
      \"newValue\": {
        \"newPriority\": \"60\",
        \"newSubpriorityBase\": \"-5185024\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1418915564\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"15546\",
      \"transactionPHID\": \"PHID-XACT-TASK-x3x2kk74g6wtlf5\",
      \"transactionType\": \"subpriority\",
      \"oldValue\": \"0\",
      \"newValue\": {
        \"newPriority\": \"60\",
        \"newSubpriorityBase\": \"-2479104\",
        \"direction\": \">\"
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1418915116\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"15543\",
      \"transactionPHID\": \"PHID-XACT-TASK-vn24om34rtj5gjw\",
      \"transactionType\": \"core:subscribers\",
      \"oldValue\": [],
      \"newValue\": [
        \"PHID-USER-asa2yo6hrxumlby23jgs\"
      ],
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1418915066\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"15542\",
      \"transactionPHID\": \"PHID-XACT-TASK-f6ufmlr2xwjaphd\",
      \"transactionType\": \"priority\",
      \"oldValue\": 50,
      \"newValue\": 60,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1418915066\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"13631\",
      \"transactionPHID\": \"PHID-XACT-TASK-7su5r6cwn4tyrfv\",
      \"transactionType\": \"priority\",
      \"oldValue\": 20,
      \"newValue\": 50,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-asa2yo6hrxumlby23jgs\",
      \"dateCreated\": \"1415709477\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"9399\",
      \"transactionPHID\": \"PHID-XACT-TASK-yjorjspbyi4ito7\",
      \"transactionType\": \"priority\",
      \"oldValue\": 50,
      \"newValue\": 20,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1409232505\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"748\",
      \"transactionPHID\": \"PHID-XACT-TASK-xzcwpbgrjveqg34\",
      \"transactionType\": \"core:customfield\",
      \"oldValue\": null,
      \"newValue\": \"Reported by Andrew Calcutt April 22nd 2014. \",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1403026431\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"747\",
      \"transactionPHID\": \"PHID-XACT-TASK-d5ay27a74ulr5lr\",
      \"transactionType\": \"core:edge\",
      \"oldValue\": [],
      \"newValue\": {
        \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\": {
          \"src\": \"PHID-TASK-bfxxv2p53m2jb2mc46u6\",
          \"type\": 41,
          \"dst\": \"PHID-PROJ-ux7yp5gt7nxp4nheoj2k\"
        }
      },
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1403026431\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"746\",
      \"transactionPHID\": \"PHID-XACT-TASK-yzlsqfwe6iu6xyd\",
      \"transactionType\": \"priority\",
      \"oldValue\": null,
      \"newValue\": 50,
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1403026431\"
    },
    {
      \"taskID\": \"201\",
      \"transactionID\": \"745\",
      \"transactionPHID\": \"PHID-XACT-TASK-blqma5ticvtpkzg\",
      \"transactionType\": \"status\",
      \"oldValue\": null,
      \"newValue\": \"open\",
      \"comments\": null,
      \"authorPHID\": \"PHID-USER-sghrh2czfimlokkc7smz\",
      \"dateCreated\": \"1403026431\"
    }
  ]
}")

(setq test-alist (json-read-from-string test-json))



  


(assoc '201 test-alist)


test-alist



(setq foo-raw "{
          \"name\": \"xxxxx\",
          \"job\": \"xxxxxx\",
          \"projects\": [
            {
              \"name\": \"xxxxx\",
              \"date\": \"xxxxx\",
              \"about\": \"xxxxxxxxxx\"
            },
    {
              \"name\": \"xxxxx\",
              \"date\": \"xxxxx\",
              \"about\": \"xxxxxxxxxx\"
            },
    {
              \"name\": \"xxxxx\",
              \"date\": \"xxxxx\",
              \"about\": \"xxxxxxxxxx\"
            }
          ]
        }")

(defun lookup-value (key alist)
  (cdr (assoc key alist)))

(defun phab-maniphest-transaction-is-comment (transaction)
  (equal (lookup-value 'transactionType transaction) "core:comment"))

(defun phab-maniphest-comment-loopover (transactions)
  (dolist (transaction transactions)
    (if (phab-maniphest-transaction-is-comment transaction)
        (phab-maniphest-comment-handler transaction))))

(defun phab-maniphest-comment-handler (comment)
  (insert "** comment:\n")
  (insert (format "%s" (lookup-value 'comments comment))))

(defun phab-maniphest-prep-buffer ()
  (switch-to-buffer "foo")
  (erase-buffer))

(defun phab-maniphest-transactions-sort (transactions)
  "Transactions that are provided by the Phabricator API are not
sorted, so we need to sort them here. TRANSACTIONS is a list of
maniphest transactions (converted to an alist) that are provided
by the \(fn sort) `gettasktransactions` Phabricator API method."
  (sort transactions (lambda (a b)
                       (let* ((a-time (string-to-number (lookup-value 'dateCreated a)))
                              (b-time (string-to-number (lookup-value 'dateCreated b))))
                         (if (< a-time b-time)
                             t)))))

(let* ((json-object-type 'alist)
       (json-array-type 'list)
       (test-transactions-full-list (json-read-from-string test-transacitons-json))
       (test-transactions (cdr (assoc '\201 test-transactions-full-list))))

  (setq mylist (phab-maniphest-transactions-sort test-transactions))

  (phab-maniphest-prep-buffer)
  (phab-maniphest-comment-loopover test-transactions))

