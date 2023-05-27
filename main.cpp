#include "logger.h"

int main()
{
    Logger logger;

    logger.debug("do not display current level");
    logger.info("success! {}", 12.345);
    logger.warn("you will have some problem maybe...");
    logger.error("What the...");
    return 0;
}