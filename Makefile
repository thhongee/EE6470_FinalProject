

# Include the Makefile.prj file extracted from project.tcl
-include Makefile.prj

# Rule to update Makefile.prj anytime project.tcl changes
Makefile.prj : project.tcl
	@bdw_makegen

# List subdirectories that contain memory libraries
MEMLIBS =

# List subdirectories that contain interface libraries
IFLIBS =

# The cmp_result target compares the golden results file (golden.dat) with
# the simulation results file (data.out) written by the testbench into the 
# BDW_SIM_CONFIG simulation configuration directory. This is run automatically
# at the end of each simulation (endOfSimCommand in project.tcl).
GOLD_FILE = golden.dat
RESULTS_FILE = $(BDW_SIM_CONFIG_DIR)/response.dat

cmp_result:
	@if [ -f $(RESULTS_FILE) ] ; then \
	  echo "****************************************" ; \
	  echo `date` ; \
	  echo "Performing Simulation Results Comparison" ; \
	  echo "for $(BDW_SIM_CONFIG) Simulation..." ; \
	  if diff $(RESULTS_FILE) $(GOLD_FILE) ; then \
	    echo "  $(BDW_SIM_CONFIG): SIMULATION PASSED" ; \
	    bdw_sim_pass ; \
	  else \
	    echo "  $(BDW_SIM_CONFIG): SIMULATION FAILED" ; \
	    bdw_sim_fail ; \
	  fi ; \
	  echo "****************************************" ; \
	else \
	  echo "****************************************" ; \
	  echo `date` ; \
	  echo "ERROR: Simulation output doesn't exist" ; \
	  echo "for $(BDW_SIM_CONFIG) Simulation..." ; \
	  echo "  $(BDW_SIM_CONFIG): SIMULATION FAILED" ; \
	  bdw_sim_fail ; \
	  echo "****************************************" ; \
	fi


# Clean out undesirable junk files from the project directory
# Uses the automatically created clean_all target from Makefile.prj
clean: clean_all
	@rm -rf bdw_work vsim* *.wlf data.out *~ *.bak *.BAK Makefile.prj
	@rm -rf core *.pro *.user *.log .*.qws .*.check .stack* .parts*
	@rm -rf rc.* fv .stratus*

CLEAN: clean
