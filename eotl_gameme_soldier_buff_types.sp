#pragma semicolon 1
#pragma newdecls required

#define PLUGIN_AUTHOR "ack"
#define PLUGIN_VERSION "0.2"

#define BUFF_TYPE_BUFF_BANNER       1
#define BUFF_TYPE_BATTALIONS_BACKUP 2
#define BUFF_TYPE_CONCHEROR         3

#include <sourcemod>

public Plugin myinfo = {
	name = "eotl gameme soldier buff types", 
	author = PLUGIN_AUTHOR, 
	description = "GameMe stats for each soldier buff type", 
	version = PLUGIN_VERSION, 
	url = ""
};

public void OnPluginStart() {
	HookEvent("deploy_buff_banner", EventBuffDeployed, EventHookMode_Pre);
}

public Action EventBuffDeployed(Handle event, const char[] name, bool dontBroadcast) {
	int client = GetClientOfUserId(GetEventInt(event, "buff_owner"));
	int buff_type = GetEventInt(event, "buff_type");


	if(IsFakeClient(client) || !IsClientInGame(client)) {
		return Plugin_Continue;
	}

	switch(buff_type) {
		case BUFF_TYPE_BUFF_BANNER:
		{
			LogToGame("\"%L\" triggered \"soldierbuff_buff_banner\"", client);
		}

		case BUFF_TYPE_BATTALIONS_BACKUP:
		{
			LogToGame("\"%L\" triggered \"soldierbuff_battalions_backup\"", client);
		}

		case BUFF_TYPE_CONCHEROR:
		{
			LogToGame("\"%L\" triggered \"soldierbuff_concheror\"", client);
		}

		default:
		{
			LogMessage("%n did unknown buff type: %d", client, buff_type);
		}
	}
	return Plugin_Continue;
}