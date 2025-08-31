# Nom du design
export DESIGN_NAME = picorv32

# Nom de la plateforme technologique de destination
export PLATFORM    = asap7

# Fichiers sources
export VERILOG_FILES = $(DESIGN_HOME)/src/$(DESIGN_NICKNAME)/$(DESIGN_NAME).v

# Fichier de contraintes temporelles
export SDC_FILE      = $(DESIGN_HOME)/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

# Densité du circuit. (100 = pas d'espace libre)
# Réduire la valeur pour simplifier le placement et le routage.
# Augmenter la valeur pour réduire la taille du circuit.
export CORE_UTILIZATION       = 70

# Forme du circuit. 1 pour carré
export CORE_ASPECT_RATIO      = 1

# Taille des marges
export CORE_MARGIN            = 5

# Compacité du placement (1.0 un seul blob de cellules)
# Réduire la valeur pour disperser les cellules et améliorer le routage
# Augmenter la valeur pour regrouper les cellules et avoir de meilleures performances (In'ch Allah).
export PLACE_DENSITY          = 0.7

# Configuration du CPU
# RTFM https://github.com/YosysHQ/picorv32?tab=readme-ov-file#verilog-module-parameters
export VERILOG_TOP_PARAMS = \
	BARREL_SHIFTER 1 \
	COMPRESSED_ISA 1 \
	ENABLE_MUL 1 \
	ENABLE_DIV 1 \
    ENABLE_IRQ 1