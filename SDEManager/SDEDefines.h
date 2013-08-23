#ifndef SDEManager_SDEDefines_h
#define SDEManager_SDEDefines_h

typedef enum {
	SDEAttributeTypeCombatEffect,
	SDEAttributeTypeDistanceEffect,
	SDEAttributeTypeStatusEffect,
	SDEAttributeTypeAreaEffect,
	SDEAttributeTypeControlEffect,
	SDEAttributeTypeActionEffect,
	SDEAttributeTypeWound
} SDEAttributeType;

typedef enum {
	SDEItemTypeRed = 1,
	SDEItemTypeYellow,
	SDEItemTypeGreen,
	SDEItemTypeBlue
} SDEItemType;

BOOL isIpad;

#endif
