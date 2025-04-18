//
// ROADMAP
//  * Make the timeouts configurable via environment variables
//  * Make this script overridable so users can define their own workflows
//  * Make taking screenshots optional
//
var synthetics = require('Synthetics');
const log = require('SyntheticsLogger');

const pageLoadBlueprint = async function () {

    const URL = "${endpoint}";

    let page = await synthetics.getPage();
    const response = await page.goto(URL, {waitUntil: 'domcontentloaded', timeout: 30000});

    // If you really want to take an screenshot of the target webpage, and such webpage
    // uses a front-end that needs some time to be rendered, then you may need to
    // give it some time to complete before you capture it.
    // That said, the following line was commented because it was failing on versions
    // 9.1 and 10.0 of the runtime due to a function not found error.
    //await page.waitForTimeout(15000);

    let pageTitle = await page.title();
    log.info('Page title: ' + pageTitle);
    if (response.status() !== 200) {
        throw "Failed to load page!";
    }
};

exports.handler = async () => {
    return await pageLoadBlueprint();
};