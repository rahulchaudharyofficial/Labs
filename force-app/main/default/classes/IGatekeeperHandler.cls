public interface IGatekeeperHandler {
    GatekeeperUtil.GatekeeperResponse handle(RestRequest request);
}