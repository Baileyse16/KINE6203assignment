%Sean Bailey
%9/22/22
%This Code will feature a User vs User game of tic tac toe

uiwait(msgbox("Welcome, Are you ready to play tic tac toe? Click ''ok'' to play"));



Player1name = 'Player 1';
Player2name = 'Player 2';

% figure for the game
scrsz = get(groot,'ScreenSize');
Bcolor = [.2 .6 .3];
MAIN = figure('Position',scrsz,'Color',Bcolor,'MenuBar','none','NumberTitle','off',...
    'Pointer','hand','Visible','on');

Player1text = uicontrol('Style','text','String','Player 1 name:','units','normalized',...
        'position',[.0625 .125 .2 .0325],'FontSize',14,'FontWeight','bold');
    Player1 = uicontrol('Style','edit','units','normalized','position',[.2625 .125 .2 .0325]); 
    Player2text = uicontrol('Style','text','String','Player 2 name:','units','normalized',...
        'position',[.531255 .125 .2 .0325],'FontSize',14,'FontWeight','bold');
    Player2 = uicontrol('Style','edit','units','normalized','position',[.731255 .125 .2 .0325]);
   

% title stuff
TITLE = uicontrol('style','text','units','normalized','position',[.325, .91, .4, .08],'String',...
    'Big Seans Tic Tac Toe!','FontWeight','bold','FontSize',50,'Backgroundcolor',Bcolor);
WHOSTURN = uicontrol('style','text','units','normalized','position',[.1, .85, .1, .05],'String',...
    'You''re Turn:','FontWeight','bold','FontSize',25,'Backgroundcolor',Bcolor);
Player1Win = uicontrol('style','text','visible','on','String',[Player1name,'''s number of wins'],...
    'Backgroundcolor',Bcolor,'units','normalized','position',[.05, .6, .1, .1],...
    'FontWeight','bold','FontSize',20);
Player2Win = uicontrol('style','text','visible','on','String',[Player2name,'''s number of wins'],...
    'Backgroundcolor',Bcolor,'units','normalized','position',[.15, .6, .1, .1],...
    'FontWeight','bold','FontSize',20);

flip = round(rand);
if flip == 0
    StartPlayername = Player1name;
    NUM = 1;
    otherplayer = Player2name;
else
    StartPlayername = Player2name;
    NUM = -1;
    otherplayer = Player1name;
end

%  Data/game play
DATA.youreup = uicontrol('style','text','String',StartPlayername,'units','normalized','position',[.1, .75, .1, .1],...
    'FontWeight','bold','FontSize',25,'Backgroundcolor',Bcolor,'Value',NUM,'UserData',otherplayer);
DATA.trackplayed = uicontrol('style','text','visible','off','userdata',zeros(3,3));
DATA.player1 = uicontrol('style','text','visible','on','String','0','Value',1,'UserData',0,...
    'Backgroundcolor',Bcolor,'units','normalized','position',[.05, .5, .1, .1],...
    'FontWeight','bold','FontSize',30);
DATA.player2 = uicontrol('style','text','visible','on','String','0','Value',-1,'UserData',0,...
    'Backgroundcolor',Bcolor,'units','normalized','position',[.15, .5, .1, .1],...
    'FontWeight','bold','FontSize',30);
DATA.restart = uicontrol('style','pushbutton','units','normalized','position',[.05, .25, .2, .1],'visible','off',...
    'FontSize',35,'Backgroundcolor',[0 .7 0],'FontWeight','bold','String','Play Again!');






%positions
W2Hratio = scrsz(3)/scrsz(4);
H = .15*W2Hratio;
B2T = .9 - H;
W = .15;
gap = .001;
for across = 1:3
    L2R = .3;
    for down = 1:3
        grid{down,across} = uicontrol('style','pushbutton','units','normalized','position',[L2R, B2T, W, H],...
            'UserData',[down,across]);
        L2R = L2R+W+gap;
    end
    B2T = B2T - (H + gap*W2Hratio);
end

for across = 1:3
    for down = 1:3
        set(grid{down,across},'Callback',{@Played,grid,DATA})
    end
end


function Played(object,~,grid,DATA)

Pos = object.UserData; %row,column
Pushed = grid{Pos(1),Pos(2)};

grid{Pos(1),Pos(2)}.String = DATA.youreup.String;
set(grid{Pos(1),Pos(2)},'enable','off')

Board = DATA.trackplayed.UserData; %board of plays

Board(Pos(2),Pos(1)) = DATA.youreup.Value;
DATA.trackplayed.UserData = Board;
[IFWIN, WINNER] = CheckWin (Board);




if strcmpi(IFWIN,'no')
    Current = DATA.youreup.String;
    Next = DATA.youreup.UserData;
    DATA.youreup.String= Next;
    DATA.youreup.UserData = Current;
    DATA.youreup.Value = -DATA.youreup.Value;
elseif strcmpi(IFWIN,'yes')
    if WINNER == DATA.youreup.Value
        WinningPlayer = DATA.youreup.String;
    else
        WinningPlayer = DATA.youreup.UserData;
        fprintf('shouldn''t happen... why did this happen?')
    end
    if WINNER == 1
        DATA.player1.UserData = DATA.player1.UserData + 1;
        DATA.player1.String = num2str(DATA.player1.UserData);
    elseif WINNER == -1
        DATA.player2.UserData = DATA.player2.UserData + 1;
        DATA.player2.String = num2str(DATA.player2.UserData);
    else
        fprintf('Error with winning count...')
    end
    DATA.trackplayed.UserData = zeros(3,3);
    DATA.restart.Visible = 'on';
    for across1 = 1:3
        for down1 = 1:3
            set(grid{down1,across1},'enable','off')
        end
    end
    DATA.restart.Callback = {@RestartGame,grid};
elseif strcmpi(IFWIN,'tie')
    DATA.trackplayed.UserData = zeros(3,3);
    DATA.restart.Visible = 'on';
    DATA.restart.Callback = {@RestartGame,grid};
end






end



function RestartGame(object,~,grid)

object.Visible = 'off';
    for across2 = 1:3
        for down2 = 1:3
            set(grid{down2,across2},'enable','on','String','','CData',[])
        end
    end
   
end

%  end