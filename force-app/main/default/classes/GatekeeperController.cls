/**
 * Gatekeeper Service(s) controller
 */

@RestResource(urlMapping='/v01/gks')
global class GatekeeperController {
    @HttpPost
    global static String doPost() {
        GatekeeperUtil.GatekeeperResponse response = new GatekeeperUtil.GatekeeperResponse();
        IGatekeeperHandler handler = new GatekeeperHandler();
        try
        {
            RestRequest req = RestContext.request;
            response = handler.handle(req);
        }
        catch(Exception e)
        {
            response.status = GatekeeperUtil.STATUS_ERROR;
            response.statusCode = GatekeeperUtil.STATUS_CODE_ERROR;
            response.response = e.getMessage();
        }
        return JSON.serialize(response);
    }
}