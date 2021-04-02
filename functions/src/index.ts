import * as admin from 'firebase-admin';

admin.initializeApp();

export {sendNotification} from './notifications';
export {getAdminSignInToken, confirmEmail, sendEmail} from './authentication';
export {sdPropagateScore, sdCalculateFormPosition} from './sportsday/sportsday';
export {getSendingSecret, studentSendMessage} from './safeguarding';
export {logging} from './logging';
