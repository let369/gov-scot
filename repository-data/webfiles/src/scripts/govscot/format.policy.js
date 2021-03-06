// POLICY FORMAT

/* global window */

'use strict';

import displayToggle from './component.display-toggle';
import SideNavigation from '../../scss/design-system-preview/components/side-navigation/side-navigation';

const policyPage = {
    init: function(){
        displayToggle.init();
        this.initSideNavigation();
    },

    initSideNavigation: function () {
        const sideNavigationModules = [].slice.call(document.querySelectorAll('[data-module="ds-side-navigation"]'));
        sideNavigationModules.forEach(sideNavigation => new SideNavigation(sideNavigation).init());
    }
};

window.format = policyPage;
window.format.init();

export default policyPage;
