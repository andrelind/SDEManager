#!/bin/bash
clear
echo "********************************************"
echo "************* Starting Update **************"
echo "********************************************"
echo
mogenerator -m SDEManager/SDEManagerModel.xcdatamodeld/SDEManagerModel.xcdatamodel -M SDEManager/Entities/MachineFiles -H SDEManager/Entities --template-var arc=true
echo
echo "********************************************"
echo "************** Update done! ****************"
echo "********************************************"